package com.sulake.habbo.help
{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.habbo.communication.messages.parser.callforhelp._Str_7692;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.habbo.utils.StringUtil;
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.habbo.communication.messages.incoming.callforhelp._Str_7391;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.IWindow;

    public class SanctionInfo implements IDisposable 
    {
        private var _disposed:Boolean = false;
        private var _window:IWindowContainer;
        private var _habboHelp:HabboHelp;

        public function SanctionInfo(k:HabboHelp)
        {
            this._habboHelp = k;
        }

        public function dispose():void
        {
            if (this._disposed)
            {
                return;
            }
            if (this._window)
            {
                this._window.dispose();
                this._window = null;
            }
            this._disposed = true;
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }

        public function _Str_2826(k:_Str_7391):void
        {
            this.dispose();
            this._disposed = false;
            this._window = (this._habboHelp.getXmlWindow("sanction_info") as IWindowContainer);
            this._window.center();
            this._window.procedure = this._Str_3545;
            var _local_2:_Str_7692 = k.getParser();
            if (_local_2._Str_22005 == "cfh.reason.EMPTY")
            {
                this._window.findChildByName("no_sanction_info").visible = true;
                this._window.findChildByName("last_sanction_type").visible = false;
                this._window.findChildByName("sanction_start_time").visible = false;
                this._window.findChildByName("sanction_reason").visible = false;
                this._window.findChildByName("probation_info").visible = false;
            }
            else
            {
                this._window.findChildByName("last_sanction_type").caption = ((this._habboHelp.localization.getLocalization("help.sanction.last.sanction") + " ") + this._Str_19338("current", _local_2._Str_22691, _local_2._Str_22497));
                if (_local_2._Str_22957)
                {
                    (this._window.findChildByName("last_sanction_type") as ITextWindow).textColor = 0xFF0000;
                }
                this._window.findChildByName("sanction_start_time").caption = ((this._habboHelp.localization.getLocalization("generic.start.time") + " ") + _local_2._Str_25720);
                this._window.findChildByName("sanction_reason").caption = ((this._habboHelp.localization.getLocalization("generic.reason") + " ") + _local_2._Str_22005);
                if (_local_2._Str_16442)
                {
                    this._window.findChildByName("probation_info").visible = false;
                }
                else
                {
                    this._window.findChildByName("probation_info").caption = ((this._habboHelp.localization.getLocalization("help.sanction.probation.days.left") + " ") + (int((_local_2._Str_20904 / 24)) + 1));
                }
                this._window.findChildByName("probation_reminder_title").visible = ((_local_2._Str_20904 > 0) || (_local_2._Str_16442));
            }
            if (((_local_2._Str_23177) && (!(_local_2._Str_16442))))
            {
                this._window.findChildByName("no_sanction_info").visible = false;
                this._window.findChildByName("custom_mute_info").visible = true;
                this._window.findChildByName("last_sanction_type").visible = false;
                this._window.findChildByName("sanction_start_time").visible = false;
                this._window.findChildByName("sanction_reason").visible = false;
            }
            if (!StringUtil.isEmpty(_local_2._Str_21248))
            {
                this._window.findChildByName("no_sanction_info").visible = false;
                this._window.findChildByName("trade_lock_info").caption = ((this._habboHelp.localization.getLocalization("trade.locked.until") + " ") + _local_2._Str_21248);
                this._window.findChildByName("trade_lock_info").visible = true;
            }
            this._window.findChildByName("next_sanction").caption = this._Str_19338("next", _local_2._Str_23024, _local_2._Str_23610);
            IItemListWindow(this._window.findChildByName("main_contents_list")).arrangeListItems();
        }

        private function _Str_19338(k:String, _arg_2:String, _arg_3:int):String
        {
            var _local_4:String = ("help.sanction." + k);
            switch (_arg_2)
            {
                case "ALERT":
                    _local_4 = (_local_4 + ".alert");
                    break;
                case "MUTE":
                    _local_4 = (_local_4 + ".mute");
                    break;
                case "BAN_PERMANENT":
                    _local_4 = (_local_4 + ".permban");
                    break;
                default:
                    _local_4 = (_local_4 + ".ban");
                    if (_arg_3 > 24)
                    {
                        _local_4 = (_local_4 + ".days");
                        return this._habboHelp.localization.registerParameter(_local_4, "days", (_arg_3 / 24).toString());
                    }
            }
            return this._habboHelp.localization.registerParameter(_local_4, "hours", _arg_3.toString());
        }

        private function _Str_3545(k:WindowEvent, _arg_2:IWindow):void
        {
            if (((((this._disposed) || (!(this._window))) || (!(k.type == WindowMouseEvent.CLICK))) || (!(_arg_2))))
            {
                return;
            }
            switch (_arg_2.name)
            {
                case "faq_link":
                    this._habboHelp._Str_19088();
                    return;
                case "header_button_close":
                case "ok_button":
                    this.dispose();
                    return;
            }
        }
    }
}
