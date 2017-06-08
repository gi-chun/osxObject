package com.sjp.sjplab.sjplabandroidot;

/**
 * Created by gclee on 2017. 2. 27..
 */

import android.annotation.SuppressLint;
import android.content.Context;
import android.graphics.Bitmap;
import android.media.MediaPlayer;
import android.opengl.GLSurfaceView;
import android.util.AttributeSet;

@SuppressLint("ViewConstructor")
class VideoSurfaceView extends GLSurfaceView {

    VideoRender mRenderer;
    private MediaPlayer mMediaPlayer = null;

    //gclee
    //private GLThread mGLThread;

    public interface CameraTextureListener {
        /**
         * This method is invoked when camera preview has started. After this method is invoked
         * the frames will start to be delivered to client via the onCameraFrame() callback.
         * @param width -  the width of the frames that will be delivered
         * @param height - the height of the frames that will be delivered
         */
        public void onCameraViewStarted(int width, int height);

        /**
         * This method is invoked when camera preview has been stopped for some reason.
         * No frames will be delivered via onCameraFrame() callback after this method is called.
         */
        public void onCameraViewStopped();

        /**
         * This method is invoked when a new preview frame from Camera is ready.
         * @param texIn -  the OpenGL texture ID that contains frame in RGBA format
         * @param texOut - the OpenGL texture ID that can be used to store modified frame image t display
         * @param width -  the width of the frame
         * @param height - the height of the frame
         * @return `true` if `texOut` should be displayed, `false` - to show `texIn`
         */
        public boolean onCameraTexture(int texIn, int texOut, int width, int height);

//        public boolean onCameraTexture2(ByteBuffer sourceBuffer, int width, int height);
        public Bitmap onCameraTexture2(Bitmap sourceBuffer, int width, int height);
    };

    private CameraTextureListener mTexListener;
    //gclee end

    public VideoSurfaceView(Context context) {
        super(context);
    }
    public VideoSurfaceView(Context context, AttributeSet attrs) {
        super(context, attrs);
    }

/*
public VideoSurfaceView(Context context, MediaPlayer mp) {
super(context);

setEGLContextClientVersion(2);
mMediaPlayer = mp;
mRenderer = new VideoRender(this);
setRenderer(mRenderer);
//gclee
//setRenderMode(GLSurfaceView.RENDERMODE_WHEN_DIRTY);
}
*/

    @Override
    public void onResume() {
        queueEvent(new Runnable(){
            public void run() {
                mRenderer.setMediaPlayer(mMediaPlayer);
            }});

        super.onResume();
    }

    //gclee
    /**
     * Request that the renderer render a frame.
     * This method is typically used when the render mode has been set to
     * {@link #RENDERMODE_WHEN_DIRTY}, so that frames are only rendered on demand.
     * May be called
     * from any thread. Must not be called before a renderer has been set.
     */
    public void requestRender() {
        //super.requestRender();
        //mGLThread.requestRender();
    }

    public void setMediaPlayer(MediaPlayer mp){

        setEGLContextClientVersion(2);
        mMediaPlayer = mp;
        mRenderer = new VideoRender(this);
        setRenderer(mRenderer);
    }

    public void setCameraTextureListener(CameraTextureListener texListener)
    {
        mTexListener = texListener;
    }

    public CameraTextureListener getCameraTextureListener()
    {
        return mTexListener;
    }
    //gclee end


}  // End of class VideoSurfaceView.
