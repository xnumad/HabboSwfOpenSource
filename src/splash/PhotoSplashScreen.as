package splash
{
    import flash.display.Sprite;
    import flash.display.Bitmap;
    import __AS3__.vec.Vector;
    import flash.display.DisplayObjectContainer;
    import __AS3__.vec.*;
    import splash.images.*;

    public class PhotoSplashScreen extends Sprite 
    {
        private var _Str_1140:Class;
        private var _Str_1847:Class;
        private var splashImg1:Class;
        private var splashImg2:Class;
        private var splashImg3:Class;
        private var splashImg4:Class;
        private var splashImg5:Class;
        private var splashImg6:Class;
        private var splashImg7:Class;
        private var splashImg8:Class;
        private var splashImg9:Class;
        private var splashImg10:Class;
        private var splashImg11:Class;
        private var splashImg12:Class;
        private var splashImg13:Class;
        private var splashImg14:Class;
        private var splashImg15:Class;
        private var splashImg16:Class;
        private var splashImg17:Class;
        private var splashImg18:Class;
        private var splashImg19:Class;
        private var splashImg20:Class;
        private var splashImg21:Class;
        private var splashImg22:Class;
        private var splashImg23:Class;
        private var splashImg24:Class;
        private var splashImg25:Class;
        private var splashImg26:Class;
        private var splashImg27:Class;
        private var splashImg28:Class;
        private var splashImg29:Class;
        private var splashImg30:Class;

        public function PhotoSplashScreen(k:DisplayObjectContainer)
        {
            var _local_3:Bitmap;
            this._Str_1140 = _Str_905;
            this._Str_1847 = _Str_857;
            this.splashImg1 = PhotoSplashScreen_splashImg1;
            this.splashImg2 = PhotoSplashScreen_splashImg2;
            this.splashImg3 = PhotoSplashScreen_splashImg3;
            this.splashImg4 = PhotoSplashScreen_splashImg4;
            this.splashImg5 = PhotoSplashScreen_splashImg5;
            this.splashImg6 = PhotoSplashScreen_splashImg6;
            this.splashImg7 = PhotoSplashScreen_splashImg7;
            this.splashImg8 = PhotoSplashScreen_splashImg8;
            this.splashImg9 = PhotoSplashScreen_splashImg9;
            this.splashImg10 = PhotoSplashScreen_splashImg10;
            this.splashImg11 = PhotoSplashScreen_splashImg11;
            this.splashImg12 = PhotoSplashScreen_splashImg12;
            this.splashImg13 = PhotoSplashScreen_splashImg13;
            this.splashImg14 = PhotoSplashScreen_splashImg14;
            this.splashImg15 = PhotoSplashScreen_splashImg15;
            this.splashImg16 = PhotoSplashScreen_splashImg16;
            this.splashImg17 = PhotoSplashScreen_splashImg17;
            this.splashImg18 = PhotoSplashScreen_splashImg18;
            this.splashImg19 = PhotoSplashScreen_splashImg19;
            this.splashImg20 = PhotoSplashScreen_splashImg20;
            this.splashImg21 = PhotoSplashScreen_splashImg21;
            this.splashImg22 = PhotoSplashScreen_splashImg22;
            this.splashImg23 = PhotoSplashScreen_splashImg23;
            this.splashImg24 = PhotoSplashScreen_splashImg24;
            this.splashImg25 = PhotoSplashScreen_splashImg25;
            this.splashImg26 = PhotoSplashScreen_splashImg26;
            this.splashImg27 = PhotoSplashScreen_splashImg27;
            this.splashImg28 = PhotoSplashScreen_splashImg28;
            this.splashImg29 = PhotoSplashScreen_splashImg29;
            this.splashImg30 = PhotoSplashScreen_splashImg30;
            super();
            var _local_2:Vector.<Bitmap> = new Vector.<Bitmap>(0);
            _local_3 = (new this._Str_1140() as Bitmap);
            _local_2.push(_local_3);
            var _local_4:Class = (this[("splashImg" + int((1 + Math.floor((Math.random() * 30)))))] as Class);
            if (_local_4 != null)
            {
                _local_3 = new (_local_4)();
                _local_3.x = 96;
                _local_3.y = 51;
                _local_2.push(_local_3);
            }
            _local_3 = (new this._Str_1847() as Bitmap);
            _local_2.push(_local_3);
            for each (_local_3 in _local_2)
            {
                addChild(_local_3);
            }
        }
    }
}
