package com.sjp.sjplab.sjplabandroidot;

/**
 * Created by gclee on 2017. 2. 27..
 */

import android.graphics.Bitmap;
import android.graphics.SurfaceTexture;
import android.media.MediaPlayer;
import android.opengl.GLES11Ext;
import android.opengl.GLES20;
import android.opengl.GLException;
import android.opengl.GLSurfaceView;
import android.opengl.GLUtils;
import android.opengl.Matrix;
import android.util.Log;
import android.view.Surface;

import org.opencv.android.OpenCVLoader;
import org.opencv.core.Mat;

import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.nio.FloatBuffer;
import java.nio.IntBuffer;

import javax.microedition.khronos.egl.EGLConfig;
import javax.microedition.khronos.opengles.GL10;


public class VideoRender implements GLSurfaceView.Renderer, SurfaceTexture.OnFrameAvailableListener {
    private static String TAG = "VideoRender";

    //gclee //////////////////////////////////////////////////////////////////////////////////////////////
    protected final String LOGTAG = "CameraGLRendererBase";

    // shaders
    private final String vss = ""
            + "attribute vec2 vPosition;\n"
            + "attribute vec2 vTexCoord;\n" + "varying vec2 texCoord;\n"
            + "void main() {\n" + "  texCoord = vTexCoord;\n"
            + "  gl_Position = vec4 ( vPosition.x, vPosition.y, 0.0, 1.0 );\n"
            + "}";

    private final String fssOES = ""
            + "#extension GL_OES_EGL_image_external : require\n"
            + "precision mediump float;\n"
            + "uniform samplerExternalOES sTexture;\n"
            + "varying vec2 texCoord;\n"
            + "void main() {\n"
            + "  gl_FragColor = texture2D(sTexture,texCoord);\n" + "}";

    private final String fss2D = ""
            + "precision mediump float;\n"
            + "uniform sampler2D sTexture;\n"
            + "varying vec2 texCoord;\n"
            + "void main() {\n"
            + "  gl_FragColor = texture2D(sTexture,texCoord);\n" + "}";

    // coord-s
    private final float vertices[] = {
            -1, -1,
            -1,  1,
            1, -1,
            1,  1 };
    private final float texCoordOES[] = {
            0,  1,
            0,  0,
            1,  1,
            1,  0 };
    private final float texCoord2D[] = {
            0,  0,
            0,  1,
            1,  0,
            1,  1 };

    private int[] texCamera = {0}, texFBO = {0}, texDraw = {0};
    private int[] FBO = {0};
    private int progOES = -1, prog2D = -1;
    private int vPosOES, vTCOES, vPos2D, vTC2D;

    private FloatBuffer vert, texOES, tex2D;

    protected int mCameraWidth = -1, mCameraHeight = -1;
    protected int mFBOWidth = -1, mFBOHeight = -1;
    protected int mMaxCameraWidth = -1, mMaxCameraHeight = -1;

    protected SurfaceTexture mSTexture;

    protected boolean mHaveSurface = false;
    protected boolean mHaveFBO = false;
    protected boolean mUpdateST = false;
    protected boolean mEnabled = true;
    protected boolean mIsStarted = false;

    protected VideoSurfaceView mView;
    //gclee end ///////////////////////////////////////////////////////////////////////////////////////////

    private static final int FLOAT_SIZE_BYTES = 4;
    private static final int TRIANGLE_VERTICES_DATA_STRIDE_BYTES = 5 * FLOAT_SIZE_BYTES;
    private static final int TRIANGLE_VERTICES_DATA_POS_OFFSET = 0;
    private static final int TRIANGLE_VERTICES_DATA_UV_OFFSET = 3;
    private final float[] mTriangleVerticesData = {
            // X, Y, Z, U, V
            -1.0f, -1.0f, 0, 0.f, 0.f,
            1.0f, -1.0f, 0, 1.f, 0.f,
            -1.0f,  1.0f, 0, 0.f, 1.f,
            1.0f,  1.0f, 0, 1.f, 1.f,
    };

    private FloatBuffer mTriangleVertices;

    private final String mVertexShader =
            "uniform mat4 uMVPMatrix;\n" +
                    "uniform mat4 uSTMatrix;\n" +
                    "attribute vec4 aPosition;\n" +
                    "attribute vec4 aTextureCoord;\n" +
                    "varying vec2 vTextureCoord;\n" +
                    "void main() {\n" +
                    "  gl_Position = uMVPMatrix * aPosition;\n" +
                    "  vTextureCoord = (uSTMatrix * aTextureCoord).xy;\n" +
                    "}\n";

    private final String mFragmentShader =
            "#extension GL_OES_EGL_image_external : require\n" +
                    "precision mediump float;\n" +
                    "varying vec2 vTextureCoord;\n" +
                    "uniform samplerExternalOES sTexture;\n" +
                    "void main() {\n" +
                    "  gl_FragColor = texture2D(sTexture, vTextureCoord);\n" +
                    "}\n";

    private float[] mMVPMatrix = new float[16];
    private float[] mSTMatrix = new float[16];

    private int mProgram;
    private int mTextureID;
    private int muMVPMatrixHandle;
    private int muSTMatrixHandle;
    private int maPositionHandle;
    private int maTextureHandle;

    private SurfaceTexture mSurface;
    private boolean updateSurface = false;

    private static int GL_TEXTURE_EXTERNAL_OES = 0x8D65;

    private MediaPlayer mMediaPlayer;

    private Mat mRgba;
    private Mat mGray;

    //gclee
    static {
        System.loadLibrary("native-lib");

        if (OpenCVLoader.initDebug()) {
            Log.d(TAG, "OpenCVLoader successfully loaded!");
        } else {
            Log.e(TAG, "Error: OpenCVLoader load failed!");
        }
    }
//        Bitmap bitmap;

    protected void setPreviewSize(int width, int height) {
        synchronized(this) {
            mHaveFBO = false;
            initFBO(width, height);
            mHaveFBO = true;
        }

//        VideoSurfaceView.CameraTextureListener listener = mView.getCameraTextureListener();
//        if(listener != null) listener.onCameraViewStarted(mCameraWidth, mCameraHeight);
    }

    public VideoRender(VideoSurfaceView view) {

        //gclee     ///////////////////////////////////////////////////////////////////////////////
        mView = view;
        int bytes = vertices.length * Float.SIZE / Byte.SIZE;
        vert   = ByteBuffer.allocateDirect(bytes).order(ByteOrder.nativeOrder()).asFloatBuffer();
        texOES = ByteBuffer.allocateDirect(bytes).order(ByteOrder.nativeOrder()).asFloatBuffer();
        tex2D  = ByteBuffer.allocateDirect(bytes).order(ByteOrder.nativeOrder()).asFloatBuffer();
        vert.put(vertices).position(0);
        texOES.put(texCoordOES).position(0);
        tex2D.put(texCoord2D).position(0);
        //gclee end ///////////////////////////////////////////////////////////////////////////////

        mTriangleVertices = ByteBuffer.allocateDirect(
                mTriangleVerticesData.length * FLOAT_SIZE_BYTES)
                .order(ByteOrder.nativeOrder()).asFloatBuffer();
        mTriangleVertices.put(mTriangleVerticesData).position(0);

        Matrix.setIdentityM(mSTMatrix, 0);

        //gclee
        //bitmap = BitmapFactory.decodeResource(context.getResources(), R.raw.testvideo);
//            Bitmap.Config conf = Bitmap.Config.ARGB_4444; // see other conf types
//            bitmap = Bitmap.createBitmap(1280, 720, conf); // this creates a MUTABLE bitmap
    }

    public void setMediaPlayer(MediaPlayer player) {
        mMediaPlayer = player;
    }

    private static ByteBuffer grabMat(final int pGrabX, final int pGrabY, final int pGrabWidth, final int pGrabHeight) {

        int bufSize = pGrabWidth*pGrabHeight*4;
        ByteBuffer resultBuffer = ByteBuffer.allocateDirect(bufSize);
        resultBuffer.order(ByteOrder.LITTLE_ENDIAN);

        GLES20.glReadPixels(0, 0, pGrabWidth, pGrabHeight, GLES20.GL_RGBA, GLES20.GL_UNSIGNED_BYTE, resultBuffer);

        return  resultBuffer;
    }

    private static Bitmap grab(final int pGrabX, final int pGrabY, final int pGrabWidth, final int pGrabHeight) {

//        final int[] source = new int[pGrabWidth * (pGrabY + pGrabHeight)];
//        final IntBuffer sourceBuffer = IntBuffer.wrap(source);
//        sourceBuffer.position(0);
//
//        // TODO Check availability of OpenGL and GLES20.GL_RGBA combinations that require less conversion operations.
//        // Note: There is (said to be) a bug with glReadPixels when 'y != 0', so we simply read starting from 'y == 0'.
//        // TODO Does that bug still exist?
//        GLES20.glReadPixels(pGrabX, 0, pGrabWidth, pGrabY + pGrabHeight, GLES20.GL_RGBA, GLES20.GL_UNSIGNED_BYTE, sourceBuffer);
//
//        final int[] pixels = new int[pGrabWidth * pGrabHeight];
//
//        // Convert from RGBA_8888 (Which is actually ABGR as the whole buffer seems to be inverted) --> ARGB_8888
//        for (int y = 0; y < pGrabHeight; y++) {
//            for (int x = 0; x < pGrabWidth; x++) {
//                final int pixel = source[x + ((pGrabY + y) * pGrabWidth)];
//
//                final int blue = (pixel & 0x00FF0000) >> 16;
//                final int red = (pixel  & 0x000000FF) << 16;
//                final int greenAlpha = pixel & 0xFF00FF00;
//
//                pixels[x + ((pGrabHeight - y - 1) * pGrabWidth)] = greenAlpha | red | blue;
//            }
//        }
//
//        return Bitmap.createBitmap(pixels, pGrabWidth, pGrabHeight, Bitmap.Config.ARGB_8888);


        /////////////////////////////////////////////////////////////////////////////////////////////
        int bitmapBuffer[] = new int[pGrabWidth * pGrabHeight];
        int bitmapSource[] = new int[pGrabWidth * pGrabHeight];
        IntBuffer intBuffer = IntBuffer.wrap(bitmapBuffer);
        intBuffer.position(0);

        try {
            GLES20.glReadPixels(pGrabX, pGrabY, pGrabWidth, pGrabHeight, GL10.GL_RGBA, GL10.GL_UNSIGNED_BYTE, intBuffer);
            int offset1, offset2;
            for (int i = 0; i < pGrabHeight; i++) {
                offset1 = i * pGrabWidth;
                offset2 = (pGrabHeight - i - 1) * pGrabWidth;
                for (int j = 0; j < pGrabWidth; j++) {
                    int texturePixel = bitmapBuffer[offset1 + j];
                    int blue = (texturePixel >> 16) & 0xff;
                    int red = (texturePixel << 16) & 0x00ff0000;
                    int pixel = (texturePixel & 0xff00ff00) | red | blue;
                    bitmapSource[offset2 + j] = pixel;
//                    bitmapSource[offset1 + j] = pixel;
                }
            }
        } catch (GLException e) {
            return null;
        }

        return Bitmap.createBitmap(bitmapSource, pGrabWidth, pGrabHeight, Bitmap.Config.ARGB_8888);
    }

    @Override
    public void onDrawFrame(GL10 glUnused) {
       synchronized(this) {
//                if (updateSurface) {
//                    mSurface.updateTexImage();
//                    mSurface.getTransformMatrix(mSTMatrix);
//                    updateSurface = false;
//                }

            //gclee
            //synchronized(this) {
                if (mUpdateST) {
                    mSTexture.updateTexImage();
                    mUpdateST = false;
                }
            //}

            GLES20.glClear(GLES20.GL_COLOR_BUFFER_BIT);

            VideoSurfaceView.CameraTextureListener texListener = mView.getCameraTextureListener();
            if(texListener != null) {
                //Log.d(LOGTAG, "haveUserCallback");
                // texCamera(OES) -> texFBO
                drawTex(texCamera[0], true, FBO[0]);

                // call user code (texFBO -> texDraw)
                // create bitmap and pass
                Bitmap sendBitmap;
                sendBitmap = grab(0, 0, mFBOWidth, mFBOHeight);
//                boolean modified = texListener.onCameraTexture(texFBO[0], texDraw[0], mCameraWidth, mCameraHeight);

//                int bufSize = mFBOWidth*mFBOHeight*4;
//                ByteBuffer resultBuffer = ByteBuffer.allocateDirect(bufSize);
//                resultBuffer.order(ByteOrder.LITTLE_ENDIAN);
//                boolean reboiled = grabMat(resultBuffer, 0, 0, mFBOWidth, mFBOHeight);
//                resultBuffer.rewind();
//
//                boolean modified = texListener.onCameraTexture2(resultBuffer, mFBOWidth, mFBOHeight);
//                resultBuffer.rewind();

//                ByteBuffer resultBuffer = grabMat(0, 0, mFBOWidth, mFBOHeight);
//                boolean modified = texListener.onCameraTexture2(resultBuffer, mFBOWidth, mFBOHeight);
                Bitmap returnBitmap = texListener.onCameraTexture2(sendBitmap, mFBOWidth, mFBOHeight);
                //////////////////////////////////////////
//                mRgba = new Mat(mFBOWidth, mFBOHeight, CvType.CV_8UC3);
//                mGray = new Mat(mFBOWidth, mFBOHeight, CvType.CV_8UC1);
//                // mRgba.put(0, 0, sourceBuffer.array());
//                Utils.bitmapToMat(sendBitmap, mRgba);
//                Core.flip(mRgba, mRgba, 0);
//                ConvertToGray(mRgba.getNativeObjAddr(), mGray.getNativeObjAddr());
//                //Imgproc.cvtColor(mRgba, mGray, Imgproc.COLOR_BGR2GRAY);
//                Bitmap returnBitmap = Bitmap.createBitmap(mRgba.cols(), mRgba.rows(), Bitmap.Config.ARGB_8888);
//                Utils.matToBitmap(mRgba, returnBitmap);
                //////////////////////////////////////////
                boolean modified = true;
                if(returnBitmap == null){
                    modified = false;
                }

                if(modified) {
                    //get bitmap & bitmap -> texDraw
                    // texDraw -> screen
                    drawTexBitmp(texDraw[0], returnBitmap);
                    sendBitmap.recycle();

                    //drawTexByteBuffer(texDraw[0], mFBOWidth, mFBOHeight, resultBuffer);

                    drawTex(texDraw[0], false, 0);
                } else {
                    // texFBO -> screen
                    //drawTex(texDraw[0], false, 0);
                    drawTex(texFBO[0], false, 0);
                    //drawTex(texFBO[0], true, 0);
//                    drawTex(texDraw[0], true, 0);
                }
            } else {
                Log.d(LOGTAG, "texCamera(OES) -> screen");
                // texCamera(OES) -> screen
                drawTex(texCamera[0], true, 0);
            }

            //drawTex(texCamera[0], true, 0);

            //Log.i(LOGTAG, "onDrawFrame end");
            //gclee end
        }

    }

    //gclee
    private void initTexOES(int[] tex) {
        if(tex.length == 1) {
            GLES20.glGenTextures(1, tex, 0);
            GLES20.glBindTexture(GLES11Ext.GL_TEXTURE_EXTERNAL_OES, tex[0]);
            GLES20.glTexParameteri(GLES11Ext.GL_TEXTURE_EXTERNAL_OES, GLES20.GL_TEXTURE_WRAP_S, GLES20.GL_CLAMP_TO_EDGE);
            GLES20.glTexParameteri(GLES11Ext.GL_TEXTURE_EXTERNAL_OES, GLES20.GL_TEXTURE_WRAP_T, GLES20.GL_CLAMP_TO_EDGE);
            GLES20.glTexParameteri(GLES11Ext.GL_TEXTURE_EXTERNAL_OES, GLES20.GL_TEXTURE_MIN_FILTER, GLES20.GL_NEAREST);
            GLES20.glTexParameteri(GLES11Ext.GL_TEXTURE_EXTERNAL_OES, GLES20.GL_TEXTURE_MAG_FILTER, GLES20.GL_NEAREST);
        }
    }

    private void deleteSurfaceTexture() {
        Log.d(LOGTAG, "deleteSurfaceTexture");
        if(mSTexture != null) {
            mSTexture.release();
            mSTexture = null;
            deleteTex(texCamera);
        }
    }

    private void initSurfaceTexture() {
        Log.d(LOGTAG, "initSurfaceTexture");
        deleteSurfaceTexture();
        initTexOES(texCamera);
        mSTexture = new SurfaceTexture(texCamera[0]);
        mSTexture.setOnFrameAvailableListener(this);

        //gclee
        Surface surface = new Surface(mSTexture);
        mMediaPlayer.setSurface(surface);
        mMediaPlayer.setScreenOnWhilePlaying(true);
        surface.release();

    }

    protected synchronized void doStart() {
        Log.d(LOGTAG, "doStart");


        initSurfaceTexture();
        //openCamera(mCameraIndex);
        try {
            mMediaPlayer.prepare();
        } catch (IOException t) {
            Log.e(TAG, "media player prepare failed");
        }

        synchronized(this) {
            updateSurface = false;
        }
        mMediaPlayer.start();

        mIsStarted = true;

    }


    protected void doStop() {
        Log.d(LOGTAG, "doStop");
        synchronized(this) {
            mUpdateST = false;
            mIsStarted = false;
            mHaveFBO = false;
            //closeCamera();
            mMediaPlayer.start();
            deleteSurfaceTexture();
        }
        VideoSurfaceView.CameraTextureListener listener = mView.getCameraTextureListener();
        if(listener != null) listener.onCameraViewStopped();

    }

    protected void updateState() {
        Log.d(LOGTAG, "updateState");
        Log.d(LOGTAG, "mEnabled="+mEnabled+", mHaveSurface="+mHaveSurface);
        //boolean willStart = mEnabled && mHaveSurface && mView.getVisibility() == View.VISIBLE;
        boolean willStart = mEnabled && mHaveSurface;
        if (willStart != mIsStarted) {
            if(willStart) doStart();
            else doStop();
        } else {
            Log.d(LOGTAG, "keeping State unchanged");
        }
        Log.d(LOGTAG, "updateState end");
    }

    private static int loadShader_gclee(String vss, String fss) {
        Log.d("CameraGLRendererBase", "loadShader");
        int vshader = GLES20.glCreateShader(GLES20.GL_VERTEX_SHADER);
        GLES20.glShaderSource(vshader, vss);
        GLES20.glCompileShader(vshader);
        int[] status = new int[1];
        GLES20.glGetShaderiv(vshader, GLES20.GL_COMPILE_STATUS, status, 0);
        if (status[0] == 0) {
            Log.e("CameraGLRendererBase", "Could not compile vertex shader: "+GLES20.glGetShaderInfoLog(vshader));
            GLES20.glDeleteShader(vshader);
            vshader = 0;
            return 0;
        }

        int fshader = GLES20.glCreateShader(GLES20.GL_FRAGMENT_SHADER);
        GLES20.glShaderSource(fshader, fss);
        GLES20.glCompileShader(fshader);
        GLES20.glGetShaderiv(fshader, GLES20.GL_COMPILE_STATUS, status, 0);
        if (status[0] == 0) {
            Log.e("CameraGLRendererBase", "Could not compile fragment shader:"+GLES20.glGetShaderInfoLog(fshader));
            GLES20.glDeleteShader(vshader);
            GLES20.glDeleteShader(fshader);
            fshader = 0;
            return 0;
        }

        int program = GLES20.glCreateProgram();
        GLES20.glAttachShader(program, vshader);
        GLES20.glAttachShader(program, fshader);
        GLES20.glLinkProgram(program);
        GLES20.glDeleteShader(vshader);
        GLES20.glDeleteShader(fshader);
        GLES20.glGetProgramiv(program, GLES20.GL_LINK_STATUS, status, 0);
        if (status[0] == 0) {
            Log.e("CameraGLRendererBase", "Could not link shader program: "+GLES20.glGetProgramInfoLog(program));
            program = 0;
            return 0;
        }
        GLES20.glValidateProgram(program);
        GLES20.glGetProgramiv(program, GLES20.GL_VALIDATE_STATUS, status, 0);
        if (status[0] == 0)
        {
            Log.e("CameraGLRendererBase", "Shader program validation error: "+GLES20.glGetProgramInfoLog(program));
            GLES20.glDeleteProgram(program);
            program = 0;
            return 0;
        }

        Log.d("CameraGLRendererBase", "Shader program is built OK");

        return program;
    }

    private void initShaders() {
        String strGLVersion = GLES20.glGetString(GLES20.GL_VERSION);
        if (strGLVersion != null)
            Log.i(LOGTAG, "OpenGL ES version: " + strGLVersion);

        GLES20.glClearColor(1.0f, 1.0f, 1.0f, 1.0f);

        progOES = loadShader_gclee(vss, fssOES);
        vPosOES = GLES20.glGetAttribLocation(progOES, "vPosition");
        vTCOES  = GLES20.glGetAttribLocation(progOES, "vTexCoord");
        GLES20.glEnableVertexAttribArray(vPosOES);
        GLES20.glEnableVertexAttribArray(vTCOES);

        prog2D  = loadShader_gclee(vss, fss2D);
        vPos2D = GLES20.glGetAttribLocation(prog2D, "vPosition");
        vTC2D  = GLES20.glGetAttribLocation(prog2D, "vTexCoord");
        GLES20.glEnableVertexAttribArray(vPos2D);
        GLES20.glEnableVertexAttribArray(vTC2D);
    }

    private static void deleteTex(int[] tex) {
        if(tex.length == 1) {
            GLES20.glDeleteTextures(1, tex, 0);
        }
    }

    private void deleteFBO()
    {
        Log.d(LOGTAG, "deleteFBO("+mFBOWidth+"x"+mFBOHeight+")");
        GLES20.glBindFramebuffer(GLES20.GL_FRAMEBUFFER, 0);
        GLES20.glDeleteFramebuffers(1, FBO, 0);

        deleteTex(texFBO);
        deleteTex(texDraw);
        mFBOWidth = mFBOHeight = 0;
    }

    private void initFBO(int width, int height)
    {
        Log.d(LOGTAG, "initFBO("+width+"x"+height+")");

        deleteFBO();

        GLES20.glGenTextures(1, texDraw, 0);
        GLES20.glBindTexture(GLES20.GL_TEXTURE_2D, texDraw[0]);
        GLES20.glTexImage2D(GLES20.GL_TEXTURE_2D, 0, GLES20.GL_RGBA, width, height, 0, GLES20.GL_RGBA, GLES20.GL_UNSIGNED_BYTE, null);
        GLES20.glTexParameteri(GLES20.GL_TEXTURE_2D, GLES20.GL_TEXTURE_WRAP_S, GLES20.GL_CLAMP_TO_EDGE);
        GLES20.glTexParameteri(GLES20.GL_TEXTURE_2D, GLES20.GL_TEXTURE_WRAP_T, GLES20.GL_CLAMP_TO_EDGE);
        GLES20.glTexParameteri(GLES20.GL_TEXTURE_2D, GLES20.GL_TEXTURE_MIN_FILTER, GLES20.GL_NEAREST);
        GLES20.glTexParameteri(GLES20.GL_TEXTURE_2D, GLES20.GL_TEXTURE_MAG_FILTER, GLES20.GL_NEAREST);

        GLES20.glGenTextures(1, texFBO, 0);
        GLES20.glBindTexture(GLES20.GL_TEXTURE_2D, texFBO[0]);
        GLES20.glTexImage2D(GLES20.GL_TEXTURE_2D, 0, GLES20.GL_RGBA, width, height, 0, GLES20.GL_RGBA, GLES20.GL_UNSIGNED_BYTE, null);
        GLES20.glTexParameteri(GLES20.GL_TEXTURE_2D, GLES20.GL_TEXTURE_WRAP_S, GLES20.GL_CLAMP_TO_EDGE);
        GLES20.glTexParameteri(GLES20.GL_TEXTURE_2D, GLES20.GL_TEXTURE_WRAP_T, GLES20.GL_CLAMP_TO_EDGE);
        GLES20.glTexParameteri(GLES20.GL_TEXTURE_2D, GLES20.GL_TEXTURE_MIN_FILTER, GLES20.GL_NEAREST);
        GLES20.glTexParameteri(GLES20.GL_TEXTURE_2D, GLES20.GL_TEXTURE_MAG_FILTER, GLES20.GL_NEAREST);

        //int hFBO;
        GLES20.glGenFramebuffers(1, FBO, 0);
        GLES20.glBindFramebuffer(GLES20.GL_FRAMEBUFFER, FBO[0]);
        GLES20.glFramebufferTexture2D(GLES20.GL_FRAMEBUFFER, GLES20.GL_COLOR_ATTACHMENT0, GLES20.GL_TEXTURE_2D, texFBO[0], 0);
        Log.d(LOGTAG, "initFBO error status: " + GLES20.glGetError());

        int FBOstatus = GLES20.glCheckFramebufferStatus(GLES20.GL_FRAMEBUFFER);
        if (FBOstatus != GLES20.GL_FRAMEBUFFER_COMPLETE)
            Log.e(LOGTAG, "initFBO failed, status: " + FBOstatus);

        mFBOWidth  = width;
        mFBOHeight = height;
    }

    // draw texture to FBO or to screen if fbo == 0
    private void drawTex(int tex, boolean isOES, int fbo)
    {
        GLES20.glBindFramebuffer(GLES20.GL_FRAMEBUFFER, fbo);

        if(fbo == 0) {
            GLES20.glViewport(0, 0, mView.getWidth(), mView.getHeight());
        }
        else {
            GLES20.glViewport(0, 0, mFBOWidth, mFBOHeight);
        }

        GLES20.glClear(GLES20.GL_COLOR_BUFFER_BIT);

        if(isOES) {
            GLES20.glUseProgram(progOES);
            GLES20.glVertexAttribPointer(vPosOES, 2, GLES20.GL_FLOAT, false, 4*2, vert);
            GLES20.glVertexAttribPointer(vTCOES,  2, GLES20.GL_FLOAT, false, 4*2, texOES);
        } else {
            GLES20.glUseProgram(prog2D);
            GLES20.glVertexAttribPointer(vPos2D, 2, GLES20.GL_FLOAT, false, 4*2, vert);
            GLES20.glVertexAttribPointer(vTC2D,  2, GLES20.GL_FLOAT, false, 4*2, tex2D);
        }

        GLES20.glActiveTexture(GLES20.GL_TEXTURE0);

        if(isOES) {
            GLES20.glBindTexture(GLES11Ext.GL_TEXTURE_EXTERNAL_OES, tex);
            GLES20.glUniform1i(GLES20.glGetUniformLocation(progOES, "sTexture"), 0);
        } else {
            GLES20.glBindTexture(GLES20.GL_TEXTURE_2D, tex);
            GLES20.glUniform1i(GLES20.glGetUniformLocation(prog2D, "sTexture"), 0);
        }

        GLES20.glDrawArrays(GLES20.GL_TRIANGLE_STRIP, 0, 4);
        GLES20.glFlush();
    }

    private void drawTexBitmp(int tex, Bitmap pBitmap)
    {
        GLES20.glBindFramebuffer(GLES20.GL_FRAMEBUFFER, 0);

        GLES20.glViewport(0, 0, mFBOWidth, mFBOHeight);

        GLES20.glClear(GLES20.GL_COLOR_BUFFER_BIT);

        GLES20.glUseProgram(prog2D);
        GLES20.glVertexAttribPointer(vPos2D, 2, GLES20.GL_FLOAT, false, 4*2, vert);
        GLES20.glVertexAttribPointer(vTC2D,  2, GLES20.GL_FLOAT, false, 4*2, tex2D);

        GLES20.glActiveTexture(GLES20.GL_TEXTURE0);

        GLES20.glBindTexture(GLES20.GL_TEXTURE_2D, tex);
        GLES20.glUniform1i(GLES20.glGetUniformLocation(prog2D, "sTexture"), 0);

        GLUtils.texImage2D(GLES20.GL_TEXTURE_2D, 0, pBitmap, 0);
        GLES20.glFlush();
    }

    private void drawTexByteBuffer(int tex, int width, int height, ByteBuffer pByteBuffer)
    {
        GLES20.glBindFramebuffer(GLES20.GL_FRAMEBUFFER, 0);

        GLES20.glViewport(0, 0, mFBOWidth, mFBOHeight);

        GLES20.glClear(GLES20.GL_COLOR_BUFFER_BIT);

        GLES20.glUseProgram(prog2D);
        GLES20.glVertexAttribPointer(vPos2D, 2, GLES20.GL_FLOAT, false, 4*2, vert);
        GLES20.glVertexAttribPointer(vTC2D,  2, GLES20.GL_FLOAT, false, 4*2, tex2D);

        GLES20.glActiveTexture(GLES20.GL_TEXTURE0);

        GLES20.glBindTexture(GLES20.GL_TEXTURE_2D, tex);
        GLES20.glUniform1i(GLES20.glGetUniformLocation(prog2D, "sTexture"), 0);

        GLES20.glTexImage2D(GLES20.GL_TEXTURE_2D, 0, GLES20.GL_RGBA, width, height, 0, GLES20.GL_RGBA, GLES20.GL_UNSIGNED_BYTE, pByteBuffer);
        GLES20.glFlush();
    }
    //gclee end

    @Override
    public void onSurfaceChanged(GL10 glUnused, int width, int height) {
        Log.i(LOGTAG, "onSurfaceChanged("+width+"x"+width+")");

        mHaveSurface = true;
        updateState();
        setPreviewSize(width, height);
    }

    @Override
    public void onSurfaceCreated(GL10 glUnused, EGLConfig config) {

        //gclee
        initShaders();
//        mHaveSurface = true;
//        updateState();
//        setPreviewSize(mCameraWidth, mCameraHeight);


        //gclee end

//            mProgram = createProgram(mVertexShader, mFragmentShader);
//            if (mProgram == 0) {
//                return;
//            }
//            maPositionHandle = GLES20.glGetAttribLocation(mProgram, "aPosition");
//            checkGlError("glGetAttribLocation aPosition");
//            if (maPositionHandle == -1) {
//                throw new RuntimeException("Could not get attrib location for aPosition");
//            }
//            maTextureHandle = GLES20.glGetAttribLocation(mProgram, "aTextureCoord");
//            checkGlError("glGetAttribLocation aTextureCoord");
//            if (maTextureHandle == -1) {
//                throw new RuntimeException("Could not get attrib location for aTextureCoord");
//            }
//
//            muMVPMatrixHandle = GLES20.glGetUniformLocation(mProgram, "uMVPMatrix");
//            checkGlError("glGetUniformLocation uMVPMatrix");
//            if (muMVPMatrixHandle == -1) {
//                throw new RuntimeException("Could not get attrib location for uMVPMatrix");
//            }
//
//            muSTMatrixHandle = GLES20.glGetUniformLocation(mProgram, "uSTMatrix");
//            checkGlError("glGetUniformLocation uSTMatrix");
//            if (muSTMatrixHandle == -1) {
//                throw new RuntimeException("Could not get attrib location for uSTMatrix");
//            }
//
//
//            int[] textures = new int[1];
//            GLES20.glGenTextures(1, textures, 0);
//
//            mTextureID = textures[0];
//            GLES20.glBindTexture(GL_TEXTURE_EXTERNAL_OES, mTextureID);
//            checkGlError("glBindTexture mTextureID");
//
//            GLES20.glTexParameterf(GL_TEXTURE_EXTERNAL_OES, GLES20.GL_TEXTURE_MIN_FILTER,
//                                   GLES20.GL_NEAREST);
//            GLES20.glTexParameterf(GL_TEXTURE_EXTERNAL_OES, GLES20.GL_TEXTURE_MAG_FILTER,
//                                   GLES20.GL_LINEAR);

            /*
             * Create the SurfaceTexture that will feed this textureID,
             * and pass it to the MediaPlayer
             */
        //mSurface = new SurfaceTexture(mTextureID); //texFBO[0]
//            mSurface = new SurfaceTexture(texFBO[0]); //texFBO[0]
//            mSurface.setOnFrameAvailableListener(this);
//
//            Surface surface = new Surface(mSurface);
//            mMediaPlayer.setSurface(surface);
//            mMediaPlayer.setScreenOnWhilePlaying(true);
//            surface.release();
//
//            try {
//                mMediaPlayer.prepare();
//            } catch (IOException t) {
//                Log.e(TAG, "media player prepare failed");
//            }
//
//            synchronized(this) {
//                updateSurface = false;
//            }
//
//            mMediaPlayer.start();
    }

    synchronized public void onFrameAvailable(SurfaceTexture surface) {
        updateSurface = true;

        //gclee
        mUpdateST = true;
        //mView.requestRender();
        //gclee end
    }

    private int loadShader(int shaderType, String source) {
        int shader = GLES20.glCreateShader(shaderType);
        if (shader != 0) {
            GLES20.glShaderSource(shader, source);
            GLES20.glCompileShader(shader);
            int[] compiled = new int[1];
            GLES20.glGetShaderiv(shader, GLES20.GL_COMPILE_STATUS, compiled, 0);
            if (compiled[0] == 0) {
                Log.e(TAG, "Could not compile shader " + shaderType + ":");
                Log.e(TAG, GLES20.glGetShaderInfoLog(shader));
                GLES20.glDeleteShader(shader);
                shader = 0;
            }
        }
        return shader;
    }

    private int createProgram(String vertexSource, String fragmentSource) {
        int vertexShader = loadShader(GLES20.GL_VERTEX_SHADER, vertexSource);
        if (vertexShader == 0) {
            return 0;
        }
        int pixelShader = loadShader(GLES20.GL_FRAGMENT_SHADER, fragmentSource);
        if (pixelShader == 0) {
            return 0;
        }

        int program = GLES20.glCreateProgram();
        if (program != 0) {
            GLES20.glAttachShader(program, vertexShader);
            checkGlError("glAttachShader");
            GLES20.glAttachShader(program, pixelShader);
            checkGlError("glAttachShader");
            GLES20.glLinkProgram(program);
            int[] linkStatus = new int[1];
            GLES20.glGetProgramiv(program, GLES20.GL_LINK_STATUS, linkStatus, 0);
            if (linkStatus[0] != GLES20.GL_TRUE) {
                Log.e(TAG, "Could not link program: ");
                Log.e(TAG, GLES20.glGetProgramInfoLog(program));
                GLES20.glDeleteProgram(program);
                program = 0;
            }
        }
        return program;
    }

    private void checkGlError(String op) {
        int error;
        while ((error = GLES20.glGetError()) != GLES20.GL_NO_ERROR) {
            Log.e(TAG, op + ": glError " + error);
            throw new RuntimeException(op + ": glError " + error);
        }
    }

    /**
     * A native method that is implemented by the 'native-lib' native library,
     * which is packaged with this application.
     */
    public native String stringFromJNI();
    public native void nativeDetectAndDisplay(long addrMat);
    public native void OpenTLD(long matAddrGr, long matAddrRgba, long x, long y, long w, long h);
    public native void ProcessTLD(long matAddrGr, long matAddrRgba);
    public native void ConvertToGray(long matSource, long matTarget);
    public native void OpenCMT(long matAddrGr, long matAddrRgba, long x, long y, long w, long h);
    public native void ProcessCMT(long matAddrGr, long matAddrRgba);
    private static native int[] getRect();
    private static native int[] CMTgetRect();
}
