package com.sulake.habbo.help.namechange
{
    import com.sulake.habbo.help.INameChangeUI;
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.habbo.help.HabboHelp;
    import com.sulake.habbo.communication.messages.incoming.handshake.UserObjectEvent;
    import com.sulake.habbo.communication.messages.incoming.users.UserNameChangedMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.avatar.ChangeUserNameResultMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.avatar.CheckUserNameResultMessageEvent;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.habbo.localization.IHabboLocalizationManager;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.habbo.help.enum.HabboHelpTutorialEvent;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.habbo.communication.messages.outgoing.avatar.ChangeUserNameMessageComposer;
    import com.sulake.habbo.communication.messages.outgoing.avatar.CheckUserNameMessageComposer;
    import com.sulake.habbo.window.utils.IAlertDialog;
    import com.sulake.habbo.communication.messages.parser.avatar.ChangeUserNameResultMessageParser;
    import com.sulake.habbo.communication.messages.parser.avatar.CheckUserNameResultMessageParser;
    import com.sulake.habbo.communication.messages.parser.handshake.UserObjectMessageParser;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.users.UserNameChangedMessageParser;

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
            this._habboHelp.communicationManager.addHabboConnectionMessageEvent(new UserObjectEvent(this.onUserObject));
            this._habboHelp.communicationManager.addHabboConnectionMessageEvent(new UserNameChangedMessageEvent(this.onUserNameChange));
            this._habboHelp.communicationManager.addHabboConnectionMessageEvent(new ChangeUserNameResultMessageEvent(this.onChangeUserNameResult));
            this._habboHelp.communicationManager.addHabboConnectionMessageEvent(new CheckUserNameResultMessageEvent(this._Str_18696));
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

        public function get myName():String
        {
            return this._ownUserName;
        }

        public function dispose():void
        {
            if (!this._disposed)
            {
                this.disposeView();
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

        public function showView():void
        {
            if (((this._nameChangeView == null) || (this._nameChangeView.disposed)))
            {
                this._nameChangeView = new NameChangeView(this);
            }
            this._nameChangeView._Str_22632();
            this._Str_25860();
        }

        public function buildXmlWindow(k:String, _arg_2:uint=1):IWindow
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

        private function disposeWindow(k:WindowEvent=null):void
        {
        }

        public function disposeView():void
        {
            if (this._nameChangeView != null)
            {
                this._nameChangeView.dispose();
                this._nameChangeView = null;
            }
            this.disposeWindow();
        }

        public function hideView():void
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
                this.disposeView();
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

        public function windowProcedure(k:WindowEvent, _arg_2:IWindow):void
        {
            switch (k.type)
            {
                case WindowMouseEvent.CLICK:
                    if (_arg_2.name == "header_button_close")
                    {
                        this.disposeView();
                    }
                    return;
            }
        }

        public function changeName(k:String):void
        {
            this.disposeWindow();
            this._habboHelp.sendMessage(new ChangeUserNameMessageComposer(k));
        }

        public function checkName(k:String):void
        {
            this.disposeWindow();
            this._habboHelp.sendMessage(new CheckUserNameMessageComposer(k));
        }

        public function _Str_25375(name:String):void
        {
            if ((((!(this._habboHelp)) || (!(this._habboHelp.localization))) || (!(this._habboHelp.windowManager))))
            {
                return;
            }
            this._habboHelp.localization.registerParameter("help.tutorial.name.changed", "name", name);
            this._habboHelp.windowManager.alert("${generic.notice}", "${help.tutorial.name.changed}", 0, function (k:IAlertDialog, _arg_2:WindowEvent):void
            {
                k.dispose();
            });
        }

        private function onChangeUserNameResult(k:ChangeUserNameResultMessageEvent):void
        {
            if (k == null)
            {
                return;
            }
            var _local_2:ChangeUserNameResultMessageParser = k.getParser();
            if (_local_2 == null)
            {
                return;
            }
            if (_local_2.resultCode == ChangeUserNameResultMessageEvent.NAME_OK)
            {
                this._Str_25375(_local_2.name);
                this.hideView();
            }
            else
            {
                if (this._nameChangeView)
                {
                    this._nameChangeView._Str_14489(_local_2.resultCode, _local_2.name, _local_2.nameSuggestions);
                }
            }
        }

        private function _Str_18696(k:CheckUserNameResultMessageEvent):void
        {
            if (((!(k)) || (!(this._nameChangeView))))
            {
                return;
            }
            var _local_2:CheckUserNameResultMessageParser = k.getParser();
            if (_local_2.resultCode == ChangeUserNameResultMessageEvent.NAME_OK)
            {
                this._nameChangeView._Str_16320 = _local_2.name;
            }
            else
            {
                this._nameChangeView._Str_14489(_local_2.resultCode, _local_2.name, _local_2.nameSuggestions);
            }
        }

        private function onUserObject(k:IMessageEvent):void
        {
            var _local_2:UserObjectMessageParser = UserObjectEvent(k).getParser();
            this._ownUserId = _local_2.id;
            this._ownUserName = _local_2.name;
        }

        private function onUserNameChange(k:IMessageEvent):void
        {
            var _local_2:UserNameChangedMessageParser = UserNameChangedMessageEvent(k).getParser();
            if (this._ownUserId == _local_2.webId)
            {
                this._ownUserName = _local_2.newName;
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
