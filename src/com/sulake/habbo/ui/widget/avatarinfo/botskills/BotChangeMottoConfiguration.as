package com.sulake.habbo.ui.widget.avatarinfo.botskills 
{
	
    import com.sulake.habbo.ui.widget.avatarinfo.AvatarInfoWidget;
    import flash.geom.Point;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.habbo.communication.messages.outgoing._Str_416._Str_3365;
    import com.sulake.core.window.events.WindowKeyboardEvent;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.IWindow;
	/**
	 * ...
	 * @author 
	 */
	public class BotChangeMottoConfiguration extends BotSkillConfigurationViewBase 
    {
        private var _Str_6487:String = "";

        public function BotChangeMottoConfiguration(k:AvatarInfoWidget)
        {
            super(k);
        }

        override protected function get windowAssetName():String
        {
            return "motto_configuration_xml";
        }

        override protected function get skillType():int
        {
            return BotSkillsEnum.CHANGE_BOT_MOTTO;
        }

        override public function dispose():void
        {
            close();
            super.dispose();
        }

        override public function open(k:int, _arg_2:Point=null):void
        {
            super.open(k, _arg_2);
            window.procedure = this.procedure;
        }

        override public function parseConfiguration(k:String):void
        {
            this._Str_23341 = k;
        }

        private function set _Str_23341(k:String):void
        {
            this._Str_6487 = k;
            var _local_2:ITextWindow = ITextWindow(window.findChildByName("motto_input"));
            _local_2.text = this._Str_6487;
            _local_2.activate();
        }

        override protected function deactivateInputs():void
        {
            window.findChildByName("motto_input").deactivate();
        }

        private function procedure(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type == WindowMouseEvent.CLICK)
            {
                switch (_arg_2.name)
                {
                    case "save_button":
                        _Str_2268.handler.container.connection.send(new _Str_3365(_Str_2753, BotSkillsEnum.CHANGE_BOT_MOTTO, this._Str_6487));
                        close();
                        break;
                    case "cancel_button":
                        close();
                        break;
                }
            }
            if (k.type == WindowKeyboardEvent.WINDOW_EVENT_KEY_UP)
            {
                this._Str_6487 = ITextWindow(window.findChildByName("motto_input")).text;
            }
        }


    }

}
