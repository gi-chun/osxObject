package com.sjp.sjplab.sjplabandroidot;

import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.Color;
import android.graphics.Paint;
import android.media.MediaPlayer;
import android.net.Uri;
import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentTransaction;
import android.support.v7.app.AppCompatActivity;
import android.util.Log;
import android.view.MotionEvent;
import android.view.SurfaceHolder;
import android.view.SurfaceView;
import android.view.View;

import com.google.android.gms.appindexing.Action;
import com.google.android.gms.appindexing.AppIndex;
import com.google.android.gms.appindexing.Thing;
import com.google.android.gms.common.api.GoogleApiClient;

import org.opencv.android.OpenCVLoader;
import org.opencv.android.Utils;
import org.opencv.core.Core;
import org.opencv.core.CvType;
import org.opencv.core.Mat;
import org.opencv.core.Point;
import org.opencv.core.Rect;
import org.opencv.core.Scalar;
import org.opencv.core.Size;
import org.opencv.imgproc.Imgproc;

import java.util.concurrent.atomic.AtomicReference;

public class VideoActivity extends AppCompatActivity implements VideoSurfaceView.CameraTextureListener {

    private static final String TAG = "VideoActivity";
    private VideoSurfaceView mVideoView = null;
    private MediaPlayer mMediaPlayer = null;

    private static final int VIEW_MODE_RGBA = 0;
    private static final int VIEW_MODE_FEATURES = 5;
    private static final int VIEW_MODE_CMT = 8;
    private static final int START_TLD = 6;
    private static final int START_CMT = 7;

    static final int WIDTH = 400;//240;// 320;
    static final int HEIGHT = 240;// 135;// ;//240;0;
    static final int TLD_WIDTH = 640;//240;// 320;
    static final int TLD_HEIGHT = 480;// 135;// ;//240;0;

    private Mat mRgba;
    private Mat mGray;
    private Mat mRgba2;

    private int mViewMode;
    private int mSetViewMode = START_CMT;
    private int _canvasImgYOffset;
    private int _canvasImgXOffset;

    private Rect _trackedBox = null;
    private android.graphics.Rect draw_rect = null;
    SurfaceHolder _holder;
    static boolean uno = true;

    private Fragment fragment_control;
    private boolean tracking_ready = false;
    private boolean mousedrag = false;

    // Used to load the 'native-lib' library on application startup.
    static {
        System.loadLibrary("native-lib");

        if (OpenCVLoader.initDebug()) {
            Log.d(TAG, "OpenCVLoader successfully loaded!");
        } else {
            Log.e(TAG, "Error: OpenCVLoader load failed!");
        }
    }

    /**
     * ATTENTION: This was auto-generated to implement the App Indexing API.
     * See https://g.co/AppIndexing/AndroidStudio for more information.
     */
    private GoogleApiClient client;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_video);

        mViewMode = VIEW_MODE_RGBA;

        mMediaPlayer = new MediaPlayer();
        try {
            String path = "https://devimages.apple.com.edgekey.net/samplecode/avfoundationMedia/AVFoundationQueuePlayer_HLS2/master.m3u8";
            mMediaPlayer.setDataSource(path);
        } catch (Exception e) {
            e.printStackTrace();
        }

        //mVideoView = new VideoSurfaceView(this, mMediaPlayer);
        //mVideoView.setCameraTextureListener(this);//setContentView(mVideoView);
        //setContentView(R.layout.activity_video);
        mVideoView = (VideoSurfaceView) findViewById(R.id.VideoSurfaceView);
        if (mVideoView != null) {
            mVideoView.setVisibility(SurfaceView.VISIBLE);
            mVideoView.setMediaPlayer(mMediaPlayer);
            mVideoView.setCameraTextureListener(this);
        } else {
            Log.e(TAG, "onCreate: mVideoView is null!");
        }


        //////////////////////////////////////////////////////////////////////
        fragment_control = new FragmentConfig();
        FragmentTransaction ft = getSupportFragmentManager().beginTransaction();
        ft.add(R.id.overlay_fragment_container2, fragment_control);
        ft.commit();
        //////////////////////////////////////////////////////////////////////

        ///////////////////////////////////////////////////
        final AtomicReference<Point> trackedBox1stCorner = new AtomicReference<Point>();
        final Paint rectPaint = new Paint();
        rectPaint.setColor(Color.rgb(0, 255, 0));
        rectPaint.setStrokeWidth(5);
        rectPaint.setStyle(Paint.Style.STROKE);
        _holder = mVideoView.getHolder();

        mVideoView.setOnTouchListener(new View.OnTouchListener() {
            @Override
            public boolean onTouch(View v, MotionEvent event) {
                // re-init

//                if (mainMenu !=null) {
//                    this.openOptionsMenu(); // activity's onCreateOptionsMenu gets called
//                    optionsMenu.performIdentifierAction(R.id.miSubMenu1, 0);
//
//                    mainMenu.performIdentifierAction(R.id.menu_overflow, 0);
//                }

                //showPopup(getWindow().getDecorView().getRootView());

                if (event.getPointerCount() > 1){
//                    if (mainMenu !=null) {
//                        mainMenu.performIdentifierAction(R.id.menu_overflow, 0);
//                    }

                }else{
                    final Point corner = new Point(event.getX() - _canvasImgXOffset, event.getY() - _canvasImgYOffset);
                    switch (event.getAction()) {
                        case MotionEvent.ACTION_DOWN:
                            trackedBox1stCorner.set(corner);
                            Log.i("TAG", "1st corner: " + corner);
                            break;
                        case MotionEvent.ACTION_UP:
                            mousedrag = false;
                            _trackedBox = new Rect(trackedBox1stCorner.get(), corner);

                            // view control pannel
                            if(tracking_ready == false){

//                                getWindow().setFlags(WindowManager.LayoutParams.FLAG_NOT_TOUCHABLE, WindowManager.LayoutParams.FLAG_NOT_TOUCHABLE);
//
//                                FragmentTransaction ft = getSupportFragmentManager().beginTransaction();
//
//                                if(!isViewControl){
//                                    ft.setCustomAnimations(R.anim.enter_from_left, R.anim.exit_to_right);
//                                    isViewControl = true;
//                                    ft.show(fragment_control);
//                                    ft.commit();
//                                }else{
//                                    ft.setCustomAnimations(R.anim.enter_from_right, R.anim.exit_to_left);
//                                    isViewControl = false;
//                                    ft.hide(fragment_control);
//                                    ft.commit();
//                                }
//
//                                getWindow().clearFlags(WindowManager.LayoutParams.FLAG_NOT_TOUCHABLE);

                                return true;
                            }else{
                                if (_trackedBox.area() > 100) {
                                    Log.i("TAG", "Tracked box DEFINED: " + _trackedBox);
//                                    if (mViewMode == VIEW_MODE_FEATURES) {
//                                        mViewMode = START_CMT;
//                                        //_trackedBox = null;
//                                        uno = true;
//                                    }else {
//                                        mViewMode = START_TLD;
//                                        //_trackedBox = null;
//                                        uno = true;
//                                    }
                                    mViewMode = mSetViewMode;
                                } else
                                    _trackedBox = null;
                            }

                            break;
                        case MotionEvent.ACTION_MOVE:
                            if(tracking_ready) {
                                draw_rect = new android.graphics.Rect(
                                        (int) trackedBox1stCorner.get().x + _canvasImgXOffset,
                                        (int) trackedBox1stCorner.get().y + _canvasImgYOffset,
                                        (int) corner.x + _canvasImgXOffset,
                                        (int) corner.y + _canvasImgYOffset);

                                mousedrag = true;

//                                final Canvas canvas = _holder.lockCanvas(rect);
//                                canvas.drawColor(Color.TRANSPARENT, PorterDuff.Mode.CLEAR); // remove
//                                // old
//                                // rectangle
//                                canvas.drawRect(rect, rectPaint);
//                                _holder.unlockCanvasAndPost(canvas);
                            }

                            break;
                    }
                }

                return true;
            }
        });


        // ATTENTION: This was auto-generated to implement the App Indexing API.
        // See https://g.co/AppIndexing/AndroidStudio for more information.
        client = new GoogleApiClient.Builder(this).addApi(AppIndex.API).build();
    }

    @Override
    protected void onResume() {
        super.onResume();
        mVideoView.onResume();
    }

    @Override
    public boolean onCameraTexture(int texIn, int texOut, int width, int height) {

        return true;
    }

    @Override
    //public boolean onCameraTexture2(ByteBuffer sourceBuffer, int width, int height) {
    public Bitmap onCameraTexture2(Bitmap sourceBitmap, int width, int height) {

        final int viewMode = mViewMode;

        //input frame has RBGA format

        mRgba = new Mat(width, height, CvType.CV_8UC4); //CV_8UC4, CV_8UC3
        mGray = new Mat(width, height, CvType.CV_8UC1);
        // mRgba.put(0, 0, sourceBuffer.array());
        Utils.bitmapToMat(sourceBitmap, mRgba);
//        ConvertToGray(mRgba.getNativeObjAddr(), mGray.getNativeObjAddr());
        Imgproc.cvtColor(mRgba, mGray, Imgproc.COLOR_BGR2GRAY);

//        byte [] bArray;
//        bArray = new byte[width*height*4];
//        mRgba.get(0, 0, bArray);
//        sourceBuffer = ByteBuffer.wrap(bArray);

//        Bitmap bmp = Bitmap.createBitmap(mRgba.cols(), mRgba.rows(), Bitmap.Config.ARGB_8888);
//        Utils.matToBitmap(mRgba, bmp);
//        return bmp;

        switch (viewMode) {
            case VIEW_MODE_RGBA:

                if(!mousedrag) {
                    Bitmap bmp = null;
                    return bmp;
                }

                break;
            case START_TLD: {
                mGray = TLD_Reduce(mGray);
                double w = mGray.width();
                double h = mGray.height();
                if (_trackedBox == null)
                    OpenTLD(mGray.getNativeObjAddr(), mRgba.getNativeObjAddr(),
                            (long) (w / 2 - 10), (long) (h / 2 - 10),
                            (long) 10, (long) 10);
                else {

                    Log.i("TAG", "START DEFINED: " + _trackedBox.x / 2 + " "
                            + _trackedBox.y / 2 + " " + _trackedBox.width / 2 + " "
                            + _trackedBox.height / 2);

//                    double px = (w) / (double) (mJavaCameraView.getWidth());
//                    double py = (h) / (double) (mJavaCameraView.getHeight());
                    double px = (w) / (double) (width);
                    double py = (h) / (double) (height);
                    //
                    long tx, ty, twidth, theight = 0;
                    tx =  (long) (_trackedBox.x * px);
                    ty =  (long) (_trackedBox.y * py);
                    twidth = (long) (_trackedBox.width * px);
                    theight = (long) (_trackedBox.height * py);

//                    if(tx >= twidth || ty >= theight){
//                        tx =  (long) (w / 2 - 10);
//                        ty =  (long) (h / 2 - 10);
//                        twidth = (long) (10);
//                        theight = (long) (10);
//                    }

                    OpenTLD(mGray.getNativeObjAddr(), mRgba.getNativeObjAddr(),
                            tx,
                            ty,
                            twidth,
                            theight);
                }
                uno = false;
                mViewMode = VIEW_MODE_FEATURES;
            }
            break;
            case START_CMT: {
                mGray = Reduce(mGray);
                //workerStop = true;

//                try {
//                    frames.put(mGray);
//                } catch (InterruptedException e) {
//                    e.printStackTrace();
//                }

                double w = mGray.width();
                double h = mGray.height();
                if (_trackedBox == null)
                    // OpenTLD(mGray.getNativeObjAddr(),
                    // mRgba.getNativeObjAddr(),(long)(w/2-w/4),(long)(
                    // h/2-h/4),(long)w/2,(long)h/2);
                    OpenCMT(mGray.getNativeObjAddr(), mRgba.getNativeObjAddr(),
                            (long) (w / 2 - 10), (long) (h / 2 - 10),
                            (long) 10, (long) 10);
                else {

                    Log.i("TAG", "START DEFINED: " + _trackedBox.x / 2 + " "
                            + _trackedBox.y / 2 + " " + _trackedBox.width / 2 + " "
                            + _trackedBox.height / 2);

                    double px = (w) / (double) (width);
                    double py = (h) / (double) (height);
                    //
                    OpenCMT(mGray.getNativeObjAddr(), mRgba.getNativeObjAddr(),
                            (long) (_trackedBox.x * px),
                            (long) (_trackedBox.y * py),
                            (long) (_trackedBox.width * px),
                            (long) (_trackedBox.height * py));
                }
                uno = false;
                mViewMode = VIEW_MODE_CMT;
            }
            break;

            case VIEW_MODE_FEATURES:
                // input frame has RGBA format
                mGray = TLD_Reduce(mGray);
                mRgba2 = TLD_ReduceColor(mRgba);

                // FindFeatures(mGray.getNativeObjAddr(), mRgba.getNativeObjAddr());
                if (uno) {
                    int w = mGray.width();
                    int h = mGray.height();
                    OpenTLD(mGray.getNativeObjAddr(), mRgba2.getNativeObjAddr(),
                            (long) w - w / 4, (long) h / 2 - h / 4, (long) w / 2,
                            (long) h / 2);
                    uno = false;
                } else {

                    ProcessTLD(mGray.getNativeObjAddr(), mRgba2.getNativeObjAddr());
                    double px = (double) mRgba.width() / (double) mRgba2.width();
                    double py = (double) mRgba.height() / (double) mRgba2.height();
                    int[] l = getRect();
                    if (l != null) {
                        Rect r = new Rect();
                        r.x = (int) (l[0] * px);
                        r.y = (int) (l[1] * py);
                        r.width = (int) (l[2] * px);
                        r.height = (int) (l[3] * py);

                        Imgproc.rectangle(mRgba, r.tl(), r.br(), new Scalar(0, 0, 255, 0), 5);
                    }
                    uno = false;

                    // Mat mTemp=mRgba;

                    // mRgba=UnReduceColor(mRgba2,mTemp.width(),mTemp.height());
                    // mTemp.release();

                }

                // mRgba2.release();
                // mGray.release();
                break;

            case VIEW_MODE_CMT:
                // input frame has RGBA format
            {
                mGray = Reduce(mGray);
                //mRgba2 = ReduceColor(mRgba);

//                try {
//                    frames.put(mGray);
                //worker  ------------------------> real
                //frames.offer(mGray);
//                } catch (InterruptedException e) {
//                    e.printStackTrace();
//                }

                //workerStop = false;
//                worker.start();

                // FindFeatures(mGray.getNativeObjAddr(), mRgba.getNativeObjAddr());
                if (uno) {
                    int w = mGray.width();
                    int h = mGray.height();
                    OpenCMT(mGray.getNativeObjAddr(), mGray.getNativeObjAddr(),
                            (long) w - w / 4, (long) h / 2 - h / 4, (long) w / 2,
                            (long) h / 2);
                    uno = false;
                } else {

//                    AsyncTask.execute(new Runnable(){
//                        public void run() {
//                            Mat grayTemp = new Mat(mGray.height(), mGray.width(), mGray.type());
//                            mGray.copyTo(grayTemp);
//                            ProcessCMT(grayTemp.getNativeObjAddr(), grayTemp.getNativeObjAddr());
//                        }
//                    });

                    ProcessCMT(mGray.getNativeObjAddr(), mRgba.getNativeObjAddr());

                    double px = (double) mRgba.width() / (double) mGray.width();
                    double py = (double) mRgba.height() / (double) mGray.height();

                    int[] l = CMTgetRect();
                    if (l != null) {
                        Point topLeft = new Point(l[0] * px, l[1] * py);
                        Point topRight = new Point(l[2] * px, l[3] * py);
                        Point bottomLeft = new Point(l[4] * px, l[5] * py);
                        Point bottomRight = new Point(l[6] * px, l[7] * py);

                        ////////////////////////////////////////////////////////////////////////
                        int roix, roiy, roiwidth, roiheight = 0;
                        roix = (int)topLeft.x;
                        roiy = (int)topLeft.y;
                        roiwidth = (int)(bottomRight.x  - topLeft.x);
                        roiheight = (int)(bottomRight.y - topLeft.y);

                        if(roix >= 0 && roiwidth >= 0 && roix+roiwidth <= mRgba.width() && roiy >=0 && roiheight >=0 && roiy+roiheight <= mRgba.height()){

                            Rect roi = new Rect(roix, roiy, roiwidth, roiheight);
                            int lineLength = 20;
                            /* corners:
                    * p1 - p2
                    * |     |
                    * p4 - p3
                    */
                            int cornerRadius = 10;
                            Scalar lineColor = new Scalar(0, 255, 0);
                            int thickness = 2;
                            int lineType = 8;
                            Point p1 = new Point(roi.x, roi.y);
                            Point p2 = new Point (roi.x+roi.width, roi.y);
                            Point p3 = new Point(roi.x+roi.width, roi.y+roi.height);
                            Point p4 = new Point (roi.x, roi.y+roi.height);

                            // draw straight lines
                            Imgproc.line(mRgba, new Point(p1.x+cornerRadius,p1.y), new Point(p1.x+cornerRadius+lineLength,p1.y), lineColor, thickness, lineType, 0);
                            Imgproc.line(mRgba, new Point (p2.x-cornerRadius-lineLength,p2.y), new Point (p2.x-cornerRadius,p2.y), lineColor, thickness, lineType, 0);

                            Imgproc.line(mRgba, new Point (p2.x,p2.y+cornerRadius), new Point (p2.x,p2.y+cornerRadius+lineLength), lineColor, thickness, lineType, 0);
                            Imgproc.line(mRgba, new Point (p3.x,p3.y-cornerRadius-lineLength), new Point (p3.x,p3.y-cornerRadius), lineColor, thickness, lineType, 0);

                            Imgproc.line(mRgba, new Point (p4.x+cornerRadius,p4.y), new Point (p4.x+cornerRadius+lineLength,p4.y), lineColor, thickness, lineType, 0);
                            Imgproc.line(mRgba, new Point (p3.x-cornerRadius-lineLength,p3.y), new Point (p3.x-cornerRadius,p3.y), lineColor, thickness, lineType, 0);

                            Imgproc.line(mRgba, new Point (p1.x,p1.y+cornerRadius), new Point (p1.x,p1.y+cornerRadius+lineLength), lineColor, thickness, lineType, 0);
                            Imgproc.line(mRgba, new Point (p4.x,p4.y-cornerRadius-lineLength), new Point (p4.x,p4.y-cornerRadius), lineColor, thickness, lineType, 0);

                            // draw arcs
                            org.opencv.core.Size sTemp = new org.opencv.core.Size(cornerRadius,cornerRadius);
                            Imgproc.ellipse( mRgba, new Point(p1.x+cornerRadius, p1.y+cornerRadius), sTemp, 180.0, 0, 90, lineColor, thickness, lineType, 0);
                            Imgproc.ellipse( mRgba, new Point(p2.x-cornerRadius, p2.y+cornerRadius), sTemp, 270.0, 0, 90, lineColor, thickness, lineType, 0);
                            Imgproc.ellipse( mRgba, new Point(p3.x-cornerRadius, p3.y-cornerRadius), sTemp, 0.0, 0, 90, lineColor, thickness, lineType, 0);
                            Imgproc.ellipse( mRgba, new Point(p4.x+cornerRadius, p4.y-cornerRadius), sTemp, 90.0, 0, 90, lineColor, thickness, lineType, 0);
                            //////////////////////////////////////////////////////////////////////////////////////

                            //draw some crosshairs around the object
                            int x, y = 0;
                            x = roi.x + roi.width / 2;
                            y = roi.y + roi.height / 2;

                            // public static void circle(Mat img, Point center, int radius, Scalar color, int thickness, int lineType, int shift)
                            Imgproc.circle(mRgba, new Point(x, y), roi.width/5, new Scalar(0, 255, 0), 1, 1, 0);
                            Imgproc.circle(mRgba, new Point(x, y), 3, new Scalar(255, 0, 0), -1);

                        }
                        ////////////////////////////////////////////////////////////////////////
//                        Imgproc.line(mRgba, topLeft, topRight, new Scalar(255, 255,
//                                255), 3);
//                        Imgproc.line(mRgba, topRight, bottomRight, new Scalar(255,
//                                255, 255), 3);
//                        Imgproc.line(mRgba, bottomRight, bottomLeft, new Scalar(255,
//                                255, 255), 3);
//                        Imgproc.line(mRgba, bottomLeft, topLeft, new Scalar(255, 255,
//                                255), 3);
                    }
                    uno = false;

                    // Mat mTemp=mRgba;

                    // mRgba=UnReduceColor(mRgba2,mTemp.width(),mTemp.height());
                    // mTemp.release();

                }
            }
            // mRgba2.release();
            // mGray.release();
            break;

        }

        //draw roi
        if(mousedrag){
            Imgproc.rectangle(mRgba, new Point(draw_rect.left, draw_rect.top), new Point(draw_rect.right, draw_rect.bottom),new Scalar(0, 0, 255));
//            Imgproc.rectangle(mRgba, new Point(draw_rect.right, draw_rect.bottom), new Point(draw_rect.left, draw_rect.top),new Scalar(0, 0, 255));
        }

        Core.flip(mRgba, mRgba, 0);
        Bitmap bmp = Bitmap.createBitmap(mRgba.cols(), mRgba.rows(), Bitmap.Config.ARGB_8888);
        Utils.matToBitmap(mRgba, bmp);
        return bmp;
    }

    @Override
    public void onCameraViewStarted(int width, int height) {

    }

    @Override
    public void onCameraViewStopped() {

    }

    Mat Reduce(Mat m) {
        // return m;
        Mat dst = new Mat();
        Imgproc.resize(m, dst, new Size(WIDTH, HEIGHT));
        return dst;
    }

    Mat TLD_Reduce(Mat m) {
        // return m;
        Mat dst = new Mat();
        Imgproc.resize(m, dst, new Size(TLD_WIDTH, TLD_HEIGHT));
        return dst;
    }

    Mat ReduceColor(Mat m) {
        Mat dst = new Mat();
        Bitmap bmp = Bitmap.createBitmap(m.width(), m.height(),
                Bitmap.Config.ARGB_8888);
        Utils.matToBitmap(m, bmp);
        Bitmap bmp2 = Bitmap.createScaledBitmap(bmp, WIDTH, HEIGHT, false);

        Utils.bitmapToMat(bmp2, dst);
        // Imgproc.resize(m, dst, new Size(WIDTH,HEIGHT), 0, 0,
        // Imgproc.INTER_CUBIC);
        return dst;
    }

    Mat TLD_ReduceColor(Mat m) {
        Mat dst = new Mat();
        Bitmap bmp = Bitmap.createBitmap(m.width(), m.height(),
                Bitmap.Config.ARGB_8888);
        Utils.matToBitmap(m, bmp);
        Bitmap bmp2 = Bitmap.createScaledBitmap(bmp, TLD_WIDTH, TLD_HEIGHT, false);

        Utils.bitmapToMat(bmp2, dst);
        // Imgproc.resize(m, dst, new Size(WIDTH,HEIGHT), 0, 0,
        // Imgproc.INTER_CUBIC);
        return dst;
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

    public void setTracking_ready(boolean bFlag) {
        tracking_ready = bFlag;
    }

    public void setmSetViewMode(int pViewMode) {
        mSetViewMode = pViewMode;
        mViewMode = VIEW_MODE_RGBA;
    }

    public void changeActivity() {
        Intent intent = new Intent(this, MainActivity.class);
        finish();
        startActivity(intent);
    }

    /**
     * ATTENTION: This was auto-generated to implement the App Indexing API.
     * See https://g.co/AppIndexing/AndroidStudio for more information.
     */
    public Action getIndexApiAction() {
        Thing object = new Thing.Builder()
                .setName("Video Page") // TODO: Define a title for the content shown.
                // TODO: Make sure this auto-generated URL is correct.
                .setUrl(Uri.parse("http://[ENTER-YOUR-URL-HERE]"))
                .build();
        return new Action.Builder(Action.TYPE_VIEW)
                .setObject(object)
                .setActionStatus(Action.STATUS_TYPE_COMPLETED)
                .build();
    }

    @Override
    public void onStart() {
        super.onStart();

        // ATTENTION: This was auto-generated to implement the App Indexing API.
        // See https://g.co/AppIndexing/AndroidStudio for more information.
//        client.connect();
//        AppIndex.AppIndexApi.start(client, getIndexApiAction());
    }

    @Override
    public void onStop() {
        super.onStop();

        // ATTENTION: This was auto-generated to implement the App Indexing API.
        // See https://g.co/AppIndexing/AndroidStudio for more information.
//        AppIndex.AppIndexApi.end(client, getIndexApiAction());
//        client.disconnect();
    }
}
