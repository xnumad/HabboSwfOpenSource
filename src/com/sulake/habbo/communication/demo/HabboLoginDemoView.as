package com.sulake.habbo.communication.demo
{
    import com.sulake.core.runtime.events.EventDispatcherWrapper;
    import com.sulake.habbo.window.utils.IModalDialog;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.components.IDropListWindow;
    import flash.utils.Dictionary;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.components.ISelectableWindow;
    import com.sulake.core.window.components.IButtonWindow;
    import com.sulake.core.window.components.ITextFieldWindow;
    import com.sulake.core.window.events.WindowMouseEvent;
    import flash.net.SharedObject;
    import com.sulake.core.window.events.WindowKeyboardEvent;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.core.utils.Map;
    import com.sulake.core.window.components.ITextWindow;
    import flash.events.Event;
    import com.sulake.habbo.communication.IHabboWebLogin;
    import com.sulake.core.window.components.*;

    public class HabboLoginDemoView extends EventDispatcherWrapper 
    {
        public static const INITCONNECTION:String = "InitConnection";

        private const SOL_ID:String = "fuselogin";

        private var _habboLogin:HabboCommunicationDemo;
        private var _dialog:IModalDialog;
        private var _window:IWindowContainer;
        private var _parsedTicket:SSOTicket;
        private var _firstTryUsingExistingSession:Boolean = false;
        public var name:String = "";
        public var password:String = "";
        private var _environmentList:IDropListWindow;
        private var _defaultPropertyValues:Dictionary;
        private var _userListItem:IWindow;
        private var _environmentItem:IWindow;
        private var _testEnvironmentIndex:int;

        public function HabboLoginDemoView(k:HabboCommunicationDemo)
        {
            this._habboLogin = k;
            this._defaultPropertyValues = new Dictionary();
            this._dialog = this._habboLogin.getModalXmlWindow("login_window", "");
            this._window = (this._dialog.rootWindow as IWindowContainer);
            this.createWindow();
        }

        override public function dispose():void
        {
            super.dispose();
            this._environmentList = null;
            if (this._dialog)
            {
                this._dialog.dispose();
                this._dialog = null;
            }
            this._defaultPropertyValues = null;
        }

        public function closeLoginWindow():void
        {
            if (this._dialog)
            {
                this._dialog.dispose();
                this._dialog = null;
            }
        }

        public function get useSSOTicket():Boolean
        {
            var k:ISelectableWindow = (this._window.findChildByName("useTicket") as ISelectableWindow);
            if (k != null)
            {
                return k.Selected;
            }
            return false;
        }

        public function get useExistingSession():Boolean
        {
            if (this._firstTryUsingExistingSession)
            {
                return true;
            }
            var k:ISelectableWindow = (this._window.findChildByName("useExistingSession") as ISelectableWindow);
            if (k != null)
            {
                return k.Selected;
            }
            return false;
        }

        private function createWindow():void
        {
            var _local_9:Array;
            var _local_10:String;
            var _local_11:Array;
            var _local_12:int;
            var _local_13:int;
            var _local_14:String;
            var _local_15:IWindowContainer;
            this._window.center();
            var k:IButtonWindow = (this._window.findChildByName("login_btn") as IButtonWindow);
            var _local_2:ITextFieldWindow = (this._window.findChildByName("name_field") as ITextFieldWindow);
            var _local_3:ITextFieldWindow = (this._window.findChildByName("pwd_field") as ITextFieldWindow);
            if (k != null)
            {
                k.addEventListener(WindowMouseEvent.CLICK, this.windowEventProcessor);
            }
            else
            {
                Logger.log("Could not find the button");
            }
            var _local_4:SharedObject = SharedObject.getLocal(this.SOL_ID, "/");
            if (_local_2 != null)
            {
                _local_2.textBackground = true;
                _local_2.textBackgroundColor = 0xFFFFFF;
                if (_local_4.data.login != null)
                {
                    _local_2.text = _local_4.data.login;
                }
                _local_2.focus();
                _local_2.setSelection(_local_2.text.length, _local_2.text.length);
                _local_2.addEventListener(WindowKeyboardEvent.WINDOW_EVENT_KEY_UP, this.windowEventProcessor);
            }
            if (_local_3 != null)
            {
                _local_3.textBackground = true;
                _local_3.textBackgroundColor = 0xFFFFFF;
                if (_local_4.data.password != null)
                {
                    _local_3.text = _local_4.data.password;
                }
                _local_3.addEventListener(WindowKeyboardEvent.WINDOW_EVENT_KEY_UP, this.windowEventProcessor);
            }
            var _local_5:ISelectableWindow = (this._window.findChildByName("useTicket") as ISelectableWindow);
            if (_local_5)
            {
                if (this._habboLogin.getBoolean("use.sso"))
                {
                    _local_5.select();
                }
            }
            var _local_6:ISelectableWindow = (this._window.findChildByName("useExistingSession") as ISelectableWindow);
            if (_local_6)
            {
                _local_6.unselect();
            }
            if (this._habboLogin.getBoolean("try.existing.session"))
            {
                this._firstTryUsingExistingSession = true;
                this._window.visible = false;
                this.windowEventProcessor(WindowEvent.allocate(WindowEvent.WINDOW_EVENT_OK, this._window, null, false));
            }
            var _local_7:IItemListWindow = (this._window.findChildByName("list") as IItemListWindow);
            this._userListItem = _local_7.removeListItemAt(0);
            var _local_8:XmlAsset = (this._habboLogin.assets.getAssetByName("login_environment_list_item") as XmlAsset);
            this._environmentItem = this._habboLogin.windowManager.buildFromXML((_local_8.content as XML));
            if (((false) || (false)))
            {
                this._environmentList = (this._window.findChildByName("environment_list") as IDropListWindow);
                _local_9 = this._habboLogin.getProperty("environment.list").split("/");
                _local_10 = ((_local_4.data.environment == null) ? "d63" : _local_4.data.environment);
                _local_11 = this.getEnvironmentNames(_local_9);
                _local_12 = this._environmentList.numMenuItems;
                _local_13 = 0;
                while (_local_13 < _local_12)
                {
                    this._environmentList.removeMenuItemAt(0);
                    _local_13++;
                }
                for each (_local_14 in _local_11)
                {
                    _local_15 = (this._environmentItem.clone() as IWindowContainer);
                    _local_15.findChildByName("title").caption = _local_14;
                    this._environmentList.addMenuItem(_local_15);
                }
                this._environmentList.selection = _local_9.indexOf(_local_10);
                this._environmentList.procedure = this.dropMenuEventHandler;
                this._testEnvironmentIndex = -1;
                this.testEnvironmentAvailable(false);
            }
        }

        private function testEnvironmentAvailable(k:Boolean):void
        {
        }

        private function getEnvironmentNames(k:Array):Array
        {
            var _local_3:String;
            var _local_4:String;
            var _local_2:Array = [];
            for each (_local_3 in k)
            {
                _local_4 = ("connection.info.name." + _local_3);
                if (this._habboLogin.propertyExists(_local_4))
                {
                    _local_2.push(this._habboLogin.getProperty(_local_4));
                }
                else
                {
                    Logger.log(("Could not find name for environment: " + _local_3));
                }
            }
            return _local_2;
        }

        private function dropMenuEventHandler(event:WindowEvent, target:IWindow):void
        {
            var so:SharedObject;
            var originalKeys:Array;
            var originalKey:String;
            var localKey:String;
            if (event.type != WindowEvent.WINDOW_EVENT_SELECTED)
            {
                return;
            }
            var environments:Array = this._habboLogin.getProperty("environment.list").split("/");
            var index:int = this._environmentList.selection;
            var environment:String = environments[index];
            try
            {
                so = SharedObject.getLocal(this.SOL_ID, "/");
                so.data.environment = environment;
                so.flush();
            }
            catch(e:Error)
            {
                Logger.log(("Could not store environment to SharedObject: " + e));
            }
            if (((false) || (false)))
            {
                originalKeys = [];
                originalKeys.push("connection.info.host");
                originalKeys.push("connection.info.port");
                originalKeys.push("url.prefix");
                originalKeys.push("site.url");
                originalKeys.push("flash.dynamic.download.url");
                originalKeys.push("flash.dynamic.download.name.template");
                originalKeys.push("flash.dynamic.avatar.download.configuration");
                originalKeys.push("flash.dynamic.avatar.download.url");
                for each (originalKey in originalKeys)
                {
                    if (this._defaultPropertyValues[originalKey] == null)
                    {
                        this._defaultPropertyValues[originalKey] = this._habboLogin.getProperty(originalKey);
                    }
                    localKey = ((originalKey + ".") + environment);
                    if (this._habboLogin.propertyExists(localKey))
                    {
                        this._habboLogin.setProperty(originalKey, this._habboLogin.getProperty(localKey));
                    }
                    else
                    {
                        this._habboLogin.setProperty(originalKey, this._defaultPropertyValues[originalKey]);
                        Logger.log(((("Key not defined: " + localKey) + ". Using default value: ") + this._defaultPropertyValues[originalKey]));
                    }
                }
                this._habboLogin.communication.updateHostParameters();
            }
            this._window.findChildByName("login_btn").enable();
            event.stopPropagation();
            event.stopImmediatePropagation();
        }

        public function populateUserList(k:Map):void
        {
            var _local_4:IWindow;
            var _local_2:IItemListWindow = (this._window.findChildByName("list") as IItemListWindow);
            if (!_local_2)
            {
                return;
            }
            this._window.findChildByName("users_info").visible = false;
            var _local_3:IWindow = this._userListItem.clone();
            _local_3.procedure = this.listEventHandler;
            var _local_5:int;
            while (_local_5 < k.length)
            {
                _local_4 = _local_3.clone();
                _local_4.id = k.getKey(_local_5);
                _local_4.caption = k.getWithIndex(_local_5);
                _local_2.addListItem(_local_4);
                _local_5++;
            }
            _local_3.dispose();
        }

        public function displayResults(k:String):void
        {
            var _local_2:ITextWindow = (this._window.findChildByName("text002") as ITextWindow);
            if (_local_2 != null)
            {
                _local_2.text = k;
            }
        }

        private function handleKeyUp(k:WindowKeyboardEvent):void
        {
            var _local_3:int;
            var _local_4:String;
            var _local_5:String;
            var _local_6:ITextFieldWindow;
            var _local_7:ITextFieldWindow;
            var _local_2:WindowKeyboardEvent = (k as WindowKeyboardEvent);
            if (_local_2.ctrlKey)
            {
                _local_3 = (_local_2.keyCode - 49);
                if (((_local_3 >= 0) && (_local_3 < 10)))
                {
                    _local_4 = this._habboLogin.getProperty((("login.user." + _local_3) + ".name"));
                    _local_5 = this._habboLogin.getProperty((("login.user." + _local_3) + ".pass"));
                    _local_6 = (this._window.findChildByName("name_field") as ITextFieldWindow);
                    _local_7 = (this._window.findChildByName("pwd_field") as ITextFieldWindow);
                    if (_local_4 != "")
                    {
                        _local_6.caption = _local_4;
                    }
                    if (_local_5 != "")
                    {
                        _local_7.caption = _local_5;
                    }
                    _local_6.setSelection(_local_6.text.length, _local_6.text.length);
                    if (_local_2.cancelable)
                    {
                        _local_2.preventDefault();
                        _local_2.preventWindowOperation();
                    }
                    k.stopImmediatePropagation();
                    k.stopPropagation();
                }
            }
        }

        private function windowEventProcessor(event:WindowEvent=null, window:IWindow=null):void
        {
            var so:SharedObject;
            if (event.type == WindowKeyboardEvent.WINDOW_EVENT_KEY_UP)
            {
                this.handleKeyUp((event as WindowKeyboardEvent));
                if ((event as WindowKeyboardEvent).keyCode != 13)
                {
                    return;
                }
            }
            var nameField:ITextFieldWindow = (this._window.findChildByName("name_field") as ITextFieldWindow);
            var passField:ITextFieldWindow = (this._window.findChildByName("pwd_field") as ITextFieldWindow);
            if (nameField != null)
            {
                this.name = nameField.text;
            }
            if (passField != null)
            {
                this.password = passField.text;
            }
            try
            {
                so = SharedObject.getLocal(this.SOL_ID, "/");
                so.data.login = this.name;
                so.data.password = this.password;
                so.flush();
            }
            catch(e:Error)
            {
                Logger.log(("Could not store developer credentials to SharedObject: " + e));
            }
            if (this.useSSOTicket)
            {
                this.initSSOTicket(this.useExistingSession);
            }
            else
            {
                dispatchEvent(new Event(INITCONNECTION));
            }
            this._window.findChildByName("login_btn").disable();
        }

        private function listEventHandler(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type != WindowMouseEvent.CLICK)
            {
                return;
            }
            this._habboLogin.sendTryLogin(this.name, this.password, _arg_2.id);
        }

        private function initSSOTicket(k:Boolean):void
        {
            if (this._parsedTicket != null)
            {
                this._parsedTicket.removeEventListener(SSOTicket.SUCCESS, this.onParsedTicketSuccess);
                this._parsedTicket.removeEventListener(SSOTicket.FAILURE, this.onParsedTicketFailure);
                this._parsedTicket = null;
            }
            var _local_2:String = "";
            if (this._habboLogin != null)
            {
                _local_2 = this._habboLogin.getProperty("url.prefix");
                _local_2 = _local_2.replace("http://", "");
                _local_2 = _local_2.replace("https://", "");
            }
            var _local_3:IHabboWebLogin = this._habboLogin.communication.habboWebLogin(this.name, this.password);
            this._parsedTicket = new SSOTicket(this._habboLogin.assets, _local_3, _local_2, k);
            this._parsedTicket.addEventListener(SSOTicket.SUCCESS, this.onParsedTicketSuccess);
            this._parsedTicket.addEventListener(SSOTicket.FAILURE, this.onParsedTicketFailure);
        }

        private function onParsedTicketSuccess(k:Event):void
        {
            Logger.log(("Got ticket: " + this._parsedTicket.ticket));
            Logger.log(("Has Facebook: " + this._parsedTicket.isFacebookUser));
            if (this._parsedTicket.isFacebookUser)
            {
                this._habboLogin.setProperty("facebook.user", "1");
            }
            this._habboLogin.flashClientUrl = this._parsedTicket.flashClientUrl;
            this._habboLogin.setSSOTicket = this._parsedTicket.ticket;
            this._parsedTicket.removeEventListener(SSOTicket.SUCCESS, this.onParsedTicketSuccess);
            this._parsedTicket.removeEventListener(SSOTicket.FAILURE, this.onParsedTicketFailure);
            this._parsedTicket = null;
            dispatchEvent(new Event(INITCONNECTION));
        }

        private function onParsedTicketFailure(k:Event):void
        {
            Logger.log("Could not get a ticket! ");
            this._parsedTicket.removeEventListener(SSOTicket.SUCCESS, this.onParsedTicketSuccess);
            this._parsedTicket.removeEventListener(SSOTicket.FAILURE, this.onParsedTicketFailure);
            this._parsedTicket = null;
            if (this._firstTryUsingExistingSession)
            {
                this._firstTryUsingExistingSession = false;
                if (((this._window) && (!(this._window.disposed))))
                {
                    this._window.visible = true;
                }
            }
        }

        public function showError(k:int, _arg_2:int, _arg_3:String):void
        {
            this._window.findChildByName("users_info").caption = ((("Received error: " + k) + " regarding message: ") + _arg_2);
            this._window.findChildByName("login_btn").enable();
        }
    }
}








