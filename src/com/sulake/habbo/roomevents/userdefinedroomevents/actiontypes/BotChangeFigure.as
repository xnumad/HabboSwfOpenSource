package com.sulake.habbo.roomevents.userdefinedroomevents.actiontypes
{
    import com.sulake.habbo.roomevents.HabboUserDefinedRoomEvents;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.habbo.roomevents.userdefinedroomevents.UserDefinedRoomEventsCtrl;
    import com.sulake.habbo.window.widgets._Str_2483;
    import com.sulake.core.window.components.IWidgetWindow;
    import com.sulake.habbo.communication.messages.incoming.userdefinedroomevents.Triggerable;
    import com.sulake.core.window.components.ITextFieldWindow;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.IWindow;

    public class BotChangeFigure extends DefaultActionType 
    {
        private static const _Str_4332:String = "\t";

        private var _component:HabboUserDefinedRoomEvents;
        private var _figureString:String;
        private var _botName:String;
        private var _window:IWindowContainer;

        override public function get code():int
        {
            return ActionTypeCodes.BOT_CHANGE_FIGURE;
        }

        override public function get requiresFurni():int
        {
            return UserDefinedRoomEventsCtrl._Str_5431;
        }

        override public function onInit(k:IWindowContainer, _arg_2:HabboUserDefinedRoomEvents):void
        {
            this._component = _arg_2;
        }

        override public function readStringParamFromForm(k:IWindowContainer):String
        {
            var _local_2:String = this._Str_2453(k, "bot_name").text;
            return (_local_2 + _Str_4332) + this._figureString;
        }

        override public function onEditStart(k:IWindowContainer, _arg_2:Triggerable):void
        {
            var _local_3:Array = _arg_2.stringData.split(_Str_4332);
            if (_local_3.length > 0)
            {
                this._botName = _local_3[0];
            }
            if (_local_3.length > 1)
            {
                this._figureString = _local_3[1];
            }
            this._Str_2453(k, "bot_name").text = this._botName;
            _Str_2483(IWidgetWindow(k.findChildByName("avatar_image")).widget).figure = this._figureString;
            k.findChildByName("capture_figure").procedure = this._Str_24248;
            this._window = k;
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

        private function _Str_24248(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type == WindowMouseEvent.CLICK)
            {
                this._figureString = this._component.sessionDataManager.figure;
                _Str_2483(IWidgetWindow(this._window.findChildByName("avatar_image")).widget).figure = this._figureString;
            }
        }
    }
}
