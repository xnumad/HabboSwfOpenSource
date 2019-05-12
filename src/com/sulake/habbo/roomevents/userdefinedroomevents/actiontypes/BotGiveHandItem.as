package com.sulake.habbo.roomevents.userdefinedroomevents.actiontypes
{
    import com.sulake.habbo.roomevents.userdefinedroomevents.UserDefinedRoomEventsCtrl;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.habbo.communication.messages.incoming.userdefinedroomevents.Triggerable;
    import com.sulake.core.window.components.ITextFieldWindow;
    import com.sulake.core.window.components.IDropMenuWindow;

    public class BotGiveHandItem extends DefaultActionType 
    {


        override public function get code():int
        {
            return ActionTypeCodes.BOT_GIVE_HAND_ITEM;
        }

        override public function get requiresFurni():int
        {
            return UserDefinedRoomEventsCtrl._Str_5431;
        }

        override public function readStringParamFromForm(k:IWindowContainer):String
        {
            var _local_2:String = this._Str_2453(k, "bot_name").text;
            return _local_2;
        }

        override public function readIntegerParamsFromForm(k:IWindowContainer):Array
        {
            var _local_2:Array = [];
            _local_2.push(this._Str_17055(k));
            return _local_2;
        }

        override public function onEditStart(k:IWindowContainer, _arg_2:Triggerable):void
        {
            this._Str_2453(k, "bot_name").text = _arg_2.stringData;
            this._Str_18464(k, _arg_2.intData[0]);
        }

        private function _Str_17055(k:IWindowContainer):int
        {
            var _local_2:Array = this._Str_5671(k, "menu_handitem")._Str_4487();
            var _local_3:int = this._Str_5671(k, "menu_handitem").selection;
            if (_local_3 == -1)
            {
                return 0;
            }
            return this._Str_10826(_local_2[_local_3]);
        }

        private function _Str_18464(k:IWindowContainer, _arg_2:int):void
        {
            var _local_3:Array = this._Str_5671(k, "menu_handitem")._Str_4487();
            var _local_4:int = -1;
            var _local_5:int;
            while (_local_5 < _local_3.length)
            {
                if (this._Str_10826(_local_3[_local_5]) == _arg_2)
                {
                    _local_4 = _local_5;
                }
                _local_5++;
            }
            this._Str_5671(k, "menu_handitem").selection = _local_4;
        }

        private function _Str_10826(k:String):int
        {
            return parseInt(k.substr(10, (k.length - 11)));
        }

        override public function get hasSpecialInputs():Boolean
        {
            return true;
        }

        private function _Str_2453(k:IWindowContainer, _arg_2:String):ITextFieldWindow
        {
            var _local_3:ITextFieldWindow = ITextFieldWindow(k.findChildByName(_arg_2));
            return _local_3;
        }

        private function _Str_5671(k:IWindowContainer, _arg_2:String):IDropMenuWindow
        {
            var _local_3:IDropMenuWindow = IDropMenuWindow(k.findChildByName(_arg_2));
            return _local_3;
        }
    }
}
