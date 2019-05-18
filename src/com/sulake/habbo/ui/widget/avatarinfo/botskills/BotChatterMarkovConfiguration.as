package com.sulake.habbo.ui.widget.avatarinfo.botskills
{
    import com.sulake.habbo.ui.widget.avatarinfo.AvatarInfoWidget;
    import flash.geom.Point;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.core.window.components.ICheckBoxWindow;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.habbo.communication.messages.outgoing._Str_416._Str_3365;
    import com.sulake.habbo.utils.HabboWebTools;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.IWindow;

    public class BotChatterMarkovConfiguration extends BotSkillConfigurationViewBase 
    {
        public function BotChatterMarkovConfiguration(k:AvatarInfoWidget)
        {
            super(k);
        }

        private static function _Str_20174(k:String):String
        {
            var _local_2:String = k;
            _local_2 = _local_2.replace(/;#;/g, " ");
            return _local_2;
        }


        override protected function get windowAssetName():String
        {
            return "chatter_configuration_xml";
        }

        override protected function get skillType():int
        {
            return BotSkillsEnum.SETUP_CHAT;
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
            var _local_2:Array;
            if (k.indexOf(";#;") == -1)
            {
                _local_2 = k.split(";");
            }
            else
            {
                _local_2 = k.split(";#;");
            }
            if (((_local_2.length == 3) && (window)))
            {
                this.text = _local_2[0];
                this._Str_14755 = ((String(_local_2[1]).toLowerCase() == "true") || (_local_2[1] == "1"));
                this._Str_12879 = int(_local_2[2]);
                this._Str_15838 = false;
            }
            else
            {
                if (((_local_2.length == 4) && (window)))
                {
                    this.text = _local_2[0];
                    this._Str_14755 = ((String(_local_2[1]).toLowerCase() == "true") || (_local_2[1] == "1"));
                    this._Str_12879 = int(_local_2[2]);
                    this._Str_15838 = ((String(_local_2[3]).toLowerCase() == "true") || (_local_2[3] == "1"));
                }
            }
        }

        override protected function deactivateInputs():void
        {
            window.findChildByName("chat_text").deactivate();
            window.findChildByName("auto_chat_checkbox").deactivate();
            window.findChildByName("markov_checkbox").deactivate();
            window.findChildByName("chat_delay_text").deactivate();
        }

        private function set text(k:String):void
        {
            var _local_2:ITextWindow = ITextWindow(window.findChildByName("chat_text"));
            _local_2.text = k;
            _local_2.activate();
        }

        private function get text():String
        {
            return ITextWindow(window.findChildByName("chat_text")).text;
        }

        private function set _Str_14755(k:Boolean):void
        {
            var _local_2:ICheckBoxWindow = ICheckBoxWindow(window.findChildByName("auto_chat_checkbox"));
            _local_2._Str_2365 = k;
            _local_2.activate();
        }

        private function get _Str_14755():Boolean
        {
            return ICheckBoxWindow(window.findChildByName("auto_chat_checkbox"))._Str_2365;
        }

        private function set _Str_15838(k:Boolean):void
        {
            var _local_2:ICheckBoxWindow = ICheckBoxWindow(window.findChildByName("markov_checkbox"));
            _local_2._Str_2365 = k;
            _local_2.activate();
        }

        private function get _Str_15838():Boolean
        {
            return ICheckBoxWindow(window.findChildByName("markov_checkbox"))._Str_2365;
        }

        private function set _Str_12879(k:int):void
        {
            var _local_2:ITextWindow = ITextWindow(window.findChildByName("chat_delay_text"));
            _local_2.text = k.toString();
            _local_2.activate();
        }

        private function get _Str_12879():int
        {
            return int(ITextWindow(window.findChildByName("chat_delay_text")).text);
        }

        private function get _Str_23395():String
        {
            return (((((_Str_20174(this.text) + ";#;") + this._Str_14755) + ";#;") + this._Str_12879) + ";#;") + this._Str_15838;
        }

        private function procedure(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type == WindowMouseEvent.CLICK)
            {
                switch (_arg_2.name)
                {
                    case "save_button":
                        _Str_2268.handler.container.connection.send(new _Str_3365(_Str_2753, BotSkillsEnum.SETUP_CHAT, this._Str_23395));
                        close();
                        return;
                    case "cancel_button":
                        close();
                        return;
                    case "help_link":
                        HabboWebTools.navigateToURL(_Str_2268.configuration.getProperty("link.format.bots.help"), "habboMain");
                        return;
                }
            }
        }
    }
}
