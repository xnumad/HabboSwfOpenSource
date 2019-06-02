package com.sulake.habbo.room.object.logic.room
{
    import com.sulake.room.object.logic.ObjectLogicBase;
    import com.sulake.room.object.IRoomObjectModelController;
    import com.sulake.habbo.room.object.RoomObjectVariableEnum;
    import com.sulake.habbo.room.messages.RoomObjectTileCursorUpdateMessage;
    import com.sulake.room.messages.RoomObjectUpdateMessage;

    public class TileCursorLogic extends ObjectLogicBase 
    {
        private static const _Str_16101:int = 0;
        private static const _Str_5992:int = 1;
        private static const _Str_16978:int = 6;

        private var _Str_16735:String;
        private var _Str_17144:Boolean;


        override public function initialize(k:XML):void
        {
            var _local_2:IRoomObjectModelController;
            if (object != null)
            {
                _local_2 = object.getModelController();
                if (_local_2 != null)
                {
                    _local_2.setNumber(RoomObjectVariableEnum.FURNITURE_ALPHA_MULTIPLIER, 1);
                    object.setState(_Str_5992, 0);
                }
            }
        }

        override public function processUpdateMessage(k:RoomObjectUpdateMessage):void
        {
            var _local_3:Number;
            var _local_4:int;
            var _local_2:RoomObjectTileCursorUpdateMessage = (k as RoomObjectTileCursorUpdateMessage);
            if (_local_2 == null)
            {
                return;
            }
            if (((!(this._Str_16735 == null)) && (this._Str_16735 == _local_2.sourceEventId)))
            {
                return;
            }
            if (_local_2.toggleVisibility)
            {
                this._Str_17144 = (!(this._Str_17144));
            }
            super.processUpdateMessage(k);
            if (object != null)
            {
                if (this._Str_17144)
                {
                    object.setState(_Str_5992, 0);
                }
                else
                {
                    if (!_local_2.visible)
                    {
                        object.setState(_Str_5992, 0);
                    }
                    else
                    {
                        _local_3 = _local_2.height;
                        object.getModelController().setNumber(RoomObjectVariableEnum.TILE_CURSOR_HEIGHT, _local_3);
                        _local_4 = ((_local_3 > 0.8) ? _Str_16978 : _Str_16101);
                        object.setState(_local_4, 0);
                    }
                }
            }
            this._Str_16735 = _local_2.sourceEventId;
        }
    }
}
