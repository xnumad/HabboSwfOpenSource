package com.sulake.habbo.phonenumber
{
    import com.sulake.core.window.components.IFrameWindow;
    import com.sulake.core.window.components.ITextFieldWindow;
    import adobe.serialization.json.JSONDecoder;
    import com.sulake.core.window.components.IDropListWindow;
    import com.sulake.habbo.utils.TextWindowUtils;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.habbo.window.utils._Str_2910;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.events.WindowKeyboardEvent;

    public class PhoneNumberCollectView 
    {
        private static const _Str_15596:Array = ["VU", "EC", "VN", "VI", "DZ", "VG", "VE", "DM", "VC", "DO", "VA", "DE", "UZ", "UY", "DK", "DJ", "US", "UG", "UA", "ET", "ES", "ER", "EH", "EG", "EE", "TZ", "TT", "TW", "TV", "GD", "GE", "GF", "GA", "GB", "FR", "FO", "FK", "FJ", "FM", "FI", "WS", "GY", "GW", "GU", "GT", "GR", "GQ", "WF", "GP", "GN", "GM", "GL", "GI", "GH", "GG", "RE", "RO", "AT", "AS", "AR", "QA", "AW", "AU", "AZ", "BA", "PT", "AC", "AD", "PW", "AG", "AE", "PR", "PS", "AF", "AL", "AI", "AO", "PY", "AM", "BW", "TG", "BY", "TD", "TK", "BS", "TJ", "BR", "BT", "TH", "TO", "TN", "TM", "TL", "CA", "BZ", "TR", "BF", "SV", "BG", "BH", "SS", "BI", "ST", "SY", "BB", "SZ", "BD", "BE", "SX", "BN", "BO", "BQ", "BJ", "TC", "BL", "TA", "BM", "CZ", "SD", "CY", "SC", "CX", "CW", "SE", "SH", "CV", "SG", "CU", "SJ", "SI", "SL", "SK", "SN", "SM", "SO", "SR", "CI", "RS", "CG", "CH", "RU", "RW", "CF", "CC", "CD", "CR", "CO", "CM", "CN", "SA", "CK", "SB", "CL", "LV", "LU", "LT", "LY", "LS", "LR", "MG", "MH", "ME", "MF", "MK", "ML", "MC", "MD", "MA", "MV", "MU", "MX", "MW", "MZ", "MY", "MN", "MM", "MP", "MO", "MR", "MQ", "MT", "MS", "NF", "NG", "NI", "NL", "NA", "NC", "NE", "NZ", "NU", "NR", "NP", "NO", "OM", "PL", "PM", "PH", "PK", "PE", "PF", "PG", "PA", "HK", "ZA", "HN", "HR", "HT", "HU", "ZM", "ZW", "ID", "IE", "IL", "IM", "IN", "IO", "IQ", "IR", "YE", "IS", "IT", "JE", "YT", "JP", "JO", "JM", "KI", "KH", "KG", "KE", "KP", "KR", "KM", "KN", "KW", "KY", "KZ", "LA", "LC", "LB", "LI", "LK"];
        private static const _Str_7625:int = 30;

        private var _component:HabboPhoneNumber;
        private var _window:IFrameWindow;
        private var _inputTextNeedsClearing:Boolean = true;
        private var _locales:Array;

        public function PhoneNumberCollectView(k:HabboPhoneNumber, _arg_2:Array)
        {
            this._component = k;
            this.createWindow(_arg_2);
        }

        public function dispose():void
        {
            if (this._window)
            {
                this._window.dispose();
                this._window = null;
            }
            this._component = null;
        }

        public function _Str_16661(k:int):void
        {
            this._window.findChildByName("phone_number_input").caption = "";
            this._inputTextNeedsClearing = true;
            this._Str_17017(true);
        }

        private function createWindow(k:Array):void
        {
            var _local_5:String;
            var _local_6:String;
            var _local_7:int;
            var _local_9:Object;
            var _local_10:String;
            if (this._window)
            {
                return;
            }
            this._window = IFrameWindow(this._component.windowManager.buildFromXML(XML(this._component.assets.getAssetByName("phonenumber_collect_xml").content)));
            this._window.center();
            this._window.findChildByName("never_link").procedure = this._Str_3055;
            this._window.findChildByName("skip_link").procedure = this._Str_3055;
            this._window.findChildByName("ok_button").procedure = this._Str_3055;
            this._window.findChildByName("header_button_close").procedure = this._Str_3055;
            this._window.findChildByName("phone_number_input").procedure = this._Str_3055;
            ITextFieldWindow(this._window.findChildByName("phone_number_input")).maxChars = _Str_7625;
            var _local_2:String = ((this._component.localizationManager.getLocalization("phone.number.collect.countries")) || ("{}"));
            var _local_3:Object = new JSONDecoder(_local_2, false).getValue();
            var _local_4:Array = _Str_15596.concat();
            this._locales = new Array();
            for each (_local_5 in _local_4)
            {
                _local_6 = _local_3[_local_5];
                if (((!(_local_6 == null)) && (_local_6.length > 0)))
                {
                    this._locales.push({
                        "code":_local_5,
                        "name":_local_6
                    });
                }
            }
            this._locales.sortOn("name");
            _local_7 = (k.length - 1);
            while (_local_7 >= 0)
            {
                _local_5 = k[_local_7];
                if (_Str_15596.indexOf(_local_5) != -1)
                {
                    _local_10 = _local_3[_local_5];
                    this._locales.unshift({
                        "code":_local_5,
                        "name":_local_10
                    });
                }
                _local_7--;
            }
            var _local_8:IDropListWindow = IDropListWindow(this._window.findChildByName("country_list"));
            for each (_local_9 in this._locales)
            {
                _local_8.addMenuItem(this._Str_23781(_local_9.code, _local_9.name));
            }
            if (_local_8.numMenuItems > 0)
            {
                _local_8.selection = 0;
            }
            TextWindowUtils._Str_20340((this._window.findChildByName("collect_summary") as ITextWindow), 3369621, 0xFFFFFF, 4306905);
            this._window.findChildByName("ok_button").disable();
            this._Str_17017(true);
        }

        private function _Str_23781(k:String, _arg_2:String):IWindow
        {
            var _local_3:IWindowContainer = IWindowContainer(this._component.windowManager.buildFromXML(XML(this._component.assets.getAssetByName("phonenumber_country_menu_item_xml").content)));
            _local_3.name = k;
            _local_3.findChildByName("country_code").caption = _arg_2;
            return _local_3;
        }

        private function get _Str_22788():String
        {
            var k:IDropListWindow = IDropListWindow(this._window.findChildByName("country_list"));
            if (k.selection == -1)
            {
                return "NOT_SELECTED";
            }
            var _local_2:Object = this._locales[k.selection];
            return (_local_2 != null) ? _local_2.code : "--";
        }

        private function _Str_16253(k:_Str_2910, _arg_2:WindowEvent):void
        {
            if (((_arg_2.type == WindowEvent.WINDOW_EVENT_OK) && (this._component)))
            {
                this._component._Str_23711();
            }
            k.dispose();
        }

        private function _Str_17017(k:Boolean):void
        {
            this._window.findChildByName("ok_button").disable();
            if (k)
            {
                this._window.findChildByName("phone_number_input").enable();
                this._window.findChildByName("never_link").visible = true;
                this._window.findChildByName("skip_link").visible = true;
                this._window.findChildByName("header_button_close").enable();
                this._window.findChildByName("country_list").enable();
            }
            else
            {
                this._window.findChildByName("phone_number_input").disable();
                this._window.findChildByName("never_link").visible = false;
                this._window.findChildByName("skip_link").visible = false;
                this._window.findChildByName("header_button_close").disable();
                this._window.findChildByName("country_list").disable();
            }
        }

        private function _Str_3055(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type == WindowMouseEvent.DOWN)
            {
                switch (_arg_2.name)
                {
                    case "header_button_close":
                    case "skip_link":
                        this._component._Str_17799(true);
                        break;
                    case "never_link":
                        this._component.windowManager.confirm("${phone.number.never.again.confirm.title}", "${phone.number.never.again.confirm.text}", 0, this._Str_16253);
                        break;
                    case "ok_button":
                        this._component._Str_22965(this._Str_22788, this._window.findChildByName("phone_number_input").caption);
                        this._Str_17017(false);
                        break;
                    case "phone_number_input":
                        if (this._inputTextNeedsClearing)
                        {
                            this._window.findChildByName("phone_number_input").caption = "";
                            this._inputTextNeedsClearing = false;
                        }
                        ITextFieldWindow(this._window.findChildByName("phone_number_input")).textColor = 0;
                        break;
                }
            }
            if (((k.type == WindowKeyboardEvent.WINDOW_EVENT_KEY_UP) && (k.target.name == "phone_number_input")))
            {
                if (((!(this._window.findChildByName("phone_number_input").caption == null)) && (this._window.findChildByName("phone_number_input").caption.length > 0)))
                {
                    this._window.findChildByName("ok_button").enable();
                }
                else
                {
                    this._window.findChildByName("ok_button").disable();
                }
            }
        }
    }
}





