package com.sulake.habbo.help.guidehelp
{
    import com.sulake.habbo.help.enum.GuideSessionStateEnum;

    public class GuideSessionData 
    {
        public static const _Str_19558:uint = 0;
        public static const _Str_15093:uint = 1;
        public static const _Str_11013:uint = 2;
        public static const _Str_14462:int = 0;
        public static const _Str_19034:int = 1;
        public static const _Str_21656:int = 2;

        private var _role:uint = 0;
        private var _activeWindow:String;
        private var _requestType:uint = 0;
        private var _requestDescription:String = "";
        private var _userId:uint = 0;
        private var _userName:String = "";
        private var _userFigure:String = "";
        private var _guideId:uint = 0;
        private var _guideName:String = "";
        private var _guideFigure:String = "";

        public function GuideSessionData()
        {
            this._activeWindow = GuideSessionStateEnum._Str_17314;
            super();
        }

        public function _Str_15842():Boolean
        {
            return (this._Str_5935()) || (this._Str_5908());
        }

        public function _Str_5935():Boolean
        {
            return (this._role == _Str_11013) && ((((this._activeWindow == GuideSessionStateEnum.USER_CREATE) || (this._activeWindow == GuideSessionStateEnum.USER_PENDING)) || (this._activeWindow == GuideSessionStateEnum.USER_ONGOING)) || (this._activeWindow == GuideSessionStateEnum.USER_FEEDBACK));
        }

        public function _Str_5908():Boolean
        {
            return (this._role == _Str_15093) && (((this._activeWindow == GuideSessionStateEnum.GUIDE_ACCEPT) || (this._activeWindow == GuideSessionStateEnum.GUIDE_ONGOING)) || (this._activeWindow == GuideSessionStateEnum.GUIDE_CLOSED));
        }

        public function _Str_14646():Boolean
        {
            return (this._activeWindow == GuideSessionStateEnum.GUIDE_ONGOING) || (this._activeWindow == GuideSessionStateEnum.USER_ONGOING);
        }

        public function set _Str_17222(k:uint):void
        {
            this._role = k;
        }

        public function get _Str_3201():String
        {
            return this._activeWindow;
        }

        public function set _Str_3201(k:String):void
        {
            this._activeWindow = k;
        }

        public function get _Str_3989():uint
        {
            return this._requestType;
        }

        public function set _Str_3989(k:uint):void
        {
            this._requestType = k;
        }

        public function get _Str_8937():String
        {
            return this._requestDescription;
        }

        public function set _Str_8937(k:String):void
        {
            this._requestDescription = k;
        }

        public function get userId():uint
        {
            return this._userId;
        }

        public function set userId(k:uint):void
        {
            this._userId = k;
        }

        public function get userName():String
        {
            return this._userName;
        }

        public function set userName(k:String):void
        {
            this._userName = k;
        }

        public function get _Str_7586():String
        {
            return this._userFigure;
        }

        public function set _Str_7586(k:String):void
        {
            this._userFigure = k;
        }

        public function get _Str_5587():uint
        {
            return this._guideId;
        }

        public function set _Str_5587(k:uint):void
        {
            this._guideId = k;
        }

        public function get guideName():String
        {
            return this._guideName;
        }

        public function set guideName(k:String):void
        {
            this._guideName = k;
        }

        public function get guideFigure():String
        {
            return this._guideFigure;
        }

        public function set guideFigure(k:String):void
        {
            this._guideFigure = k;
        }
    }
}
