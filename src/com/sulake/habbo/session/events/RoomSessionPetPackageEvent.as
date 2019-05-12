package com.sulake.habbo.session.events
{
    import com.sulake.habbo.communication.messages.parser.inventory.pets.PetFigureData;
    import com.sulake.habbo.session.IRoomSession;

    public class RoomSessionPetPackageEvent extends RoomSessionEvent 
    {
        public static const RSOPPE_OPEN_PET_PACKAGE_REQUESTED:String = "RSOPPE_OPEN_PET_PACKAGE_REQUESTED";
        public static const RSOPPE_OPEN_PET_PACKAGE_RESULT:String = "RSOPPE_OPEN_PET_PACKAGE_RESULT";

        private var _objectId:int = -1;
        private var _figureData:PetFigureData;
        private var _nameValidationStatus:int = 0;
        private var _nameValidationInfo:String = null;

        public function RoomSessionPetPackageEvent(k:String, _arg_2:IRoomSession, _arg_3:int, _arg_4:PetFigureData, _arg_5:int, _arg_6:String, _arg_7:Boolean=false, _arg_8:Boolean=false)
        {
            super(k, _arg_2, _arg_7, _arg_8);
            this._objectId = _arg_3;
            this._figureData = _arg_4;
            this._nameValidationStatus = _arg_5;
            this._nameValidationInfo = _arg_6;
        }

        public function get _Str_1577():int
        {
            return this._objectId;
        }

        public function get figureData():PetFigureData
        {
            return this._figureData;
        }

        public function get nameValidationStatus():int
        {
            return this._nameValidationStatus;
        }

        public function get nameValidationInfo():String
        {
            return this._nameValidationInfo;
        }
    }
}
