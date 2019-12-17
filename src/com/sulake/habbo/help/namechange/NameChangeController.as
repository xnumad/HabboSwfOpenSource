package com.sulake.habbo.help.namechange
{
    import com.sulake.habbo.help.INameChangeUI;
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.habbo.help.HabboHelp;
    import com.sulake.habbo.communication.messages.incoming.handshake.UserObjectEvent;
    import com.sulake.habbo.communication.messages.incoming.users._Str_4150;
    import com.sulake.habbo.communication.messages.incoming.avatar.ChangeNameUpdateEvent;
    import com.sulake.habbo.communication.messages.incoming.avatar._Str_6232;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.habbo.localization.IHabboLocalizationManager;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.habbo.help.enum.HabboHelpTutorialEvent;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.habbo.communication.messages.outgoing._Str_411._Str_12037;
    import com.sulake.habbo.communication.messages.outgoing._Str_411._Str_7887;
    import com.sulake.habbo.window.utils._Str_2418;
    import com.sulake.habbo.communication.messages.parser.avatar._Str_6553;
    import com.sulake.habbo.communication.messages.parser.avatar._Str_6537;
    import com.sulake.habbo.communication.messages.parser.handshake._Str_4139;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.users._Str_5856;

    public class NameChangeController implements INameChangeUI, IDisposable 
    {
        public static const TUI_NAME_VIEW:String = "TUI_NAME_VIEW";

        private var _disposed:Boolean;
        private var _habboHelp:HabboHelp;
        private var _nameChangeView:NameChangeView;
        private var _ownUserName:String;
        private var _ownUserId:int;

        public function NameChangeController(k:HabboHelp)
        {
            this._habboHelp = k;
            this._habboHelp.communicationManager.addHabboConnectionMessageEvent(new UserObjectEvent(this._Str_3241));
            this._habboHelp.communicationManager.addHabboConnectionMessageEvent(new _Str_4150(this.onUserNameChange));
            this._habboHelp.communicationManager.addHabboConnectionMessageEvent(new ChangeNameUpdateEvent(this._Str_18227));
            this._habboHelp.communicationManager.addHabboConnectionMessageEvent(new _Str_6232(this._Str_18696));
        }

        public function get help():HabboHelp
        {
            return this._habboHelp;
        }

        public function get assets():IAssetLibrary
        {
            return this._habboHelp.assets;
        }

        public function get localization():IHabboLocalizationManager
        {
            return this._habboHelp.localization;
        }

        public function get _Str_16619():String
        {
            return this._ownUserName;
        }

        public function dispose():void
        {
            if (!this._disposed)
            {
                this._Str_4782();
                if (this._habboHelp)
                {
                    this._habboHelp = null;
                }
                this._disposed = true;
            }
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }

        public function _Str_4731():void
        {
            if (((this._nameChangeView == null) || (this._nameChangeView.disposed)))
            {
                this._nameChangeView = new NameChangeView(this);
            }
            this._nameChangeView._Str_22632();
            this._Str_25860();
        }

        public function _Str_12245(k:String, _arg_2:uint=1):IWindow
        {
            if (this._habboHelp.assets == null)
            {
                return null;
            }
            var _local_3:XmlAsset = XmlAsset(this._habboHelp.assets.getAssetByName((k + "_xml")));
            if (((_local_3 == null) || (this._habboHelp.windowManager == null)))
            {
                return null;
            }
            return this._habboHelp.windowManager.buildFromXML(XML(_local_3.content), _arg_2);
        }

        private function _Str_6430(k:WindowEvent=null):void
        {
        }

        public function _Str_4782():void
        {
            if (this._nameChangeView != null)
            {
                this._nameChangeView.dispose();
                this._nameChangeView = null;
            }
            this._Str_6430();
        }

        public function _Str_5574():void
        {
            if (this._nameChangeView != null)
            {
                this._nameChangeView.dispose();
                this._nameChangeView = null;
            }
        }

        public function _Str_26283(k:Boolean):void
        {
            if (k == false)
            {
                this._Str_4782();
            }
        }

        public function _Str_25860():void
        {
            if (((this._habboHelp == null) || (this._habboHelp.events == null)))
            {
                return;
            }
            this._habboHelp.events.dispatchEvent(new HabboHelpTutorialEvent(HabboHelpTutorialEvent.HHTPNUFWE_AVATAR_TUTORIAL_START));
        }

        public function _Str_2533(k:WindowEvent, _arg_2:IWindow):void
        {
            switch (k.type)
            {
                case WindowMouseEvent.CLICK:
                    if (_arg_2.name == "header_button_close")
                    {
                        this._Str_4782();
                    }
                    return;
            }
        }

        public function _Str_20431(k:String):void
        {
            this._Str_6430();
            this._habboHelp._Str_2488(new _Str_12037(k));
        }

        public function checkName(k:String):void
        {
            this._Str_6430();
            this._habboHelp._Str_2488(new _Str_7887(k));
        }

        public function _Str_25375(name:String):void
        {
            if ((((!(this._habboHelp)) || (!(this._habboHelp.localization))) || (!(this._habboHelp.windowManager))))
            {
                return;
            }
            this._habboHelp.localization.registerParameter("help.tutorial.name.changed", "name", name);
            this._habboHelp.windowManager.alert("${generic.notice}", "${help.tutorial.name.changed}", 0, function (k:_Str_2418, _arg_2:WindowEvent):void
            {
                k.dispose();
            });
        }

        private function _Str_18227(k:ChangeNameUpdateEvent):void
        {
            if (k == null)
            {
                return;
            }
            var _local_2:_Str_6553 = k.getParser();
            if (_local_2 == null)
            {
                return;
            }
            if (_local_2._Str_3278 == ChangeNameUpdateEvent._Str_5797)
            {
                this._Str_25375(_local_2.name);
                this._Str_5574();
            }
            else
            {
                if (this._nameChangeView)
                {
                    this._nameChangeView._Str_14489(_local_2._Str_3278, _local_2.name, _local_2._Str_14643);
                }
            }
        }

        private function _Str_18696(k:_Str_6232):void
        {
            if (((!(k)) || (!(this._nameChangeView))))
            {
                return;
            }
            var _local_2:_Str_6537 = k.getParser();
            if (_local_2._Str_3278 == ChangeNameUpdateEvent._Str_5797)
            {
                this._nameChangeView._Str_16320 = _local_2.name;
            }
            else
            {
                this._nameChangeView._Str_14489(_local_2._Str_3278, _local_2.name, _local_2._Str_14643);
            }
        }

        private function _Str_3241(k:IMessageEvent):void
        {
            var _local_2:_Str_4139 = UserObjectEvent(k).getParser();
            this._ownUserId = _local_2.id;
            this._ownUserName = _local_2.name;
        }

        private function onUserNameChange(k:IMessageEvent):void
        {
            var _local_2:_Str_5856 = _Str_4150(k).getParser();
            if (this._ownUserId == _local_2._Str_5277)
            {
                this._ownUserName = _local_2._Str_16428;
            }
        }

        public function get _Str_16805():String
        {
            return this._ownUserName;
        }

        public function get _Str_6240():int
        {
            return this._ownUserId;
        }
    }
}
