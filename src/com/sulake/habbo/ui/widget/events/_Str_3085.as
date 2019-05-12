package com.sulake.habbo.ui.widget.events
{
    import flash.display.BitmapData;

    public class _Str_3085 extends RoomWidgetUpdateEvent 
    {
        public static const RWOPPUE_OPEN_PET_PACKAGE_REQUESTED:String = "RWOPPUE_OPEN_PET_PACKAGE_REQUESTED";
        public static const RWOPPUE_OPEN_PET_PACKAGE_RESULT:String = "RWOPPUE_OPEN_PET_PACKAGE_RESULT";
        public static const RWOPPUE_OPEN_PET_PACKAGE_UPDATE_PET_IMAGE:String = "RWOPPUE_OPEN_PET_PACKAGE_UPDATE_PET_IMAGE";

        private var _Str_2319:int = -1;
        private var _typeId:int = -1;
        private var _image:BitmapData = null;
        private var _nameValidationStatus:int = 0;
        private var _nameValidationInfo:String = null;

        public function _Str_3085(k:String, _arg_2:int, _arg_3:BitmapData, _arg_4:int, _arg_5:String, _arg_6:int, _arg_7:Boolean=false, _arg_8:Boolean=false)
        {
            super(k, _arg_7, _arg_8);
            this._Str_2319 = _arg_2;
            this._image = _arg_3;
            this._nameValidationStatus = _arg_4;
            this._nameValidationInfo = _arg_5;
            this._typeId = _arg_6;
        }

        public function get nameValidationStatus():int
        {
            return this._nameValidationStatus;
        }

        public function get nameValidationInfo():String
        {
            return this._nameValidationInfo;
        }

        public function get image():BitmapData
        {
            return this._image;
        }

        public function get _Str_1577():int
        {
            return this._Str_2319;
        }

        public function get typeId():int
        {
            return this._typeId;
        }
    }
}
