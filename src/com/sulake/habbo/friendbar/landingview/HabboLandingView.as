package com.sulake.habbo.friendbar.landingview
{
    import com.sulake.habbo.friendbar.view.AbstractView;
    import com.sulake.habbo.friendbar.IHabboLandingView;
    import com.sulake.habbo.friendbar.landingview.layout._Str_3695;
    import com.sulake.habbo.communication.IHabboCommunicationManager;
    import com.sulake.habbo.session.IRoomSessionManager;
    import com.sulake.habbo.catalog.IHabboCatalog;
    import com.sulake.habbo.navigator.IHabboNavigator;
    import com.sulake.habbo.quest.IHabboQuestEngine;
    import com.sulake.habbo.toolbar.IHabboToolbar;
    import com.sulake.habbo.help.IHabboHelp;
    import com.sulake.habbo.avatar.IHabboAvatarEditor;
    import com.sulake.habbo.game.IHabboGameManager;
    import com.sulake.core.window.IWindow;
    import com.sulake.habbo.room.IRoomEngine;
    import com.sulake.core.runtime.IContext;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.core.window.IWindowContainer;
    import flash.display.BitmapData;
    import flash.geom.Rectangle;
    import flash.geom.Point;
    import com.sulake.core.window.components.IBitmapWrapperWindow;
    import com.sulake.habbo.tracking.IHabboTracking;
    import com.sulake.habbo.window.IHabboWindowManager;
    import com.sulake.habbo.localization.IHabboLocalizationManager;
    import com.sulake.core.runtime.ComponentDependency;
    import com.sulake.iid.IIDHabboCommunicationManager;
    import com.sulake.iid.IIDHabboRoomSessionManager;
    import com.sulake.iid.IIDHabboConfigurationManager;
    import com.sulake.iid.IIDHabboCatalog;
    import com.sulake.iid.IIDHabboNavigator;
    import com.sulake.iid.IIDHabboQuestEngine;
    import com.sulake.iid.IIDHabboToolbar;
    import com.sulake.iid.IIDHabboHelp;
    import com.sulake.iid.IIDHabboGameManager;
    import com.sulake.iid.IIDHabboAvatarEditor;
    import com.sulake.iid.IIDRoomEngine;
    import __AS3__.vec.Vector;
    import com.sulake.habbo.toolbar.events.HabboToolbarEvent;
    import com.sulake.core.window.components.IDesktopWindow;
    import com.sulake.habbo.toolbar.HabboToolbarEnum;
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.habbo.communication.messages.outgoing._Str_84._Str_3719;
    import com.sulake.habbo.toolbar.HabboToolbarIconEnum;
    import com.sulake.habbo.gamecenter.GameCenterEvent;
    import com.sulake.habbo.catalog.event.CatalogEvent;
    import com.sulake.habbo.communication.messages.incoming.navigator._Str_5633;
    import com.sulake.core.utils.ErrorReportStorage;
    import com.sulake.core.assets.IAsset;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.habbo.communication.messages.outgoing._Str_57._Str_12081;
    import com.sulake.habbo.session.product.IProductDataListener;
    import com.sulake.habbo.session.product.IProductData;
    import com.sulake.habbo.communication.messages.outgoing.inventory.badges._Str_11090;
    import com.sulake.habbo.communication.messages.outgoing._Str_550._Str_11999;
    import com.sulake.habbo.session.ISessionDataManager;

    public class HabboLandingView extends AbstractView implements IHabboLandingView 
    {
        private var _landingViewLayout:_Str_3695;
        private var _communicationManager:IHabboCommunicationManager;
        private var _roomSessionManager:IRoomSessionManager;
        private var _catalog:IHabboCatalog;
        private var _navigator:IHabboNavigator;
        private var _questEngine:IHabboQuestEngine;
        private var _toolbar:IHabboToolbar;
        private var _habboHelp:IHabboHelp;
        private var _avatarEditor:IHabboAvatarEditor;
        private var _gameManager:IHabboGameManager;
        private var _gameCenterOK:Boolean = false;
        private var _errorLayout:IWindow;
        private var _roomEngine:IRoomEngine;
        private var _isInitialized:Boolean = false;

        public function HabboLandingView(k:IContext, _arg_2:uint, _arg_3:IAssetLibrary)
        {
            super(k, _arg_2, _arg_3);
        }

        public static function _Str_9079(k:IWindowContainer, _arg_2:String, _arg_3:String):void
        {
            var _local_4:IWindow = k.findChildByName(_arg_2);
            var _local_5:IWindow = k.findChildByName(_arg_3);
            var _local_6:int = _local_5.x;
            _local_5.x = ((_local_4.x + _local_4.width) + 5);
            _local_5.width = (_local_5.width + (_local_6 - _local_5.x));
        }

        public static function _Str_14396(k:IBitmapWrapperWindow, _arg_2:BitmapData, _arg_3:Rectangle=null):void
        {
            if (!k.bitmap)
            {
                k.bitmap = new BitmapData(k.width, k.height, true, 0);
            }
            else
            {
                k.bitmap.fillRect(k.bitmap.rect, 0);
            }
            var _local_4:BitmapData = k.bitmap;
            var _local_5:Rectangle = ((_arg_3 != null) ? _arg_3 : _arg_2.rect);
            _local_4.copyPixels(_arg_2, _local_5, new Point(((_local_4.width - _local_5.width) / 2), ((_local_4.height - _local_5.height) / 2)), null, null, true);
            k.invalidate();
        }


        public function get catalog():IHabboCatalog
        {
            return this._catalog;
        }

        public function get navigator():IHabboNavigator
        {
            return this._navigator;
        }

        public function get questEngine():IHabboQuestEngine
        {
            return this._questEngine;
        }

        public function get tracking():IHabboTracking
        {
            return habboTracking;
        }

        public function get windowManager():IHabboWindowManager
        {
            return _Str_2277;
        }

        public function get communicationManager():IHabboCommunicationManager
        {
            return this._communicationManager;
        }

        public function get localizationManager():IHabboLocalizationManager
        {
            return _Str_2904;
        }

        override protected function get dependencies():Vector.<ComponentDependency>
        {
            return (super.dependencies.concat(new <ComponentDependency>[new ComponentDependency(new IIDHabboCommunicationManager(), function (k:IHabboCommunicationManager):void
            {
                _communicationManager = k;
            }), new ComponentDependency(new IIDHabboRoomSessionManager(), function (k:IRoomSessionManager):void
            {
                _roomSessionManager = k;
            }), new ComponentDependency(new IIDHabboConfigurationManager(), null), new ComponentDependency(new IIDHabboCatalog(), function (k:IHabboCatalog):void
            {
                _catalog = k;
            }), new ComponentDependency(new IIDHabboNavigator(), function (k:IHabboNavigator):void
            {
                _navigator = k;
            }), new ComponentDependency(new IIDHabboQuestEngine(), function (k:IHabboQuestEngine):void
            {
                _questEngine = k;
            }), new ComponentDependency(new IIDHabboToolbar(), function (k:IHabboToolbar):void
            {
                _toolbar = k;
            }), new ComponentDependency(new IIDHabboHelp(), function (k:IHabboHelp):void
            {
                _habboHelp = k;
            }), new ComponentDependency(new IIDHabboGameManager(), function (k:IHabboGameManager):void
            {
                _gameManager = k;
            }, false), new ComponentDependency(new IIDHabboAvatarEditor(), function (k:IHabboAvatarEditor):void
            {
                _avatarEditor = k;
            }), new ComponentDependency(new IIDRoomEngine(), function (k:IRoomEngine):void
            {
                _roomEngine = k;
            })]));
        }

        override public function dispose():void
        {
            if (!disposed)
            {
                this._isInitialized = false;
                if (this._landingViewLayout)
                {
                    this._landingViewLayout.dispose();
                    this._landingViewLayout = null;
                }
                if (((!(this._toolbar == null)) && (!(this._toolbar.events == null))))
                {
                    this._toolbar.events.removeEventListener(HabboToolbarEvent.HTE_TOOLBAR_CLICK, this.onToolbarClick);
                }
                if (this._errorLayout)
                {
                    this._errorLayout.dispose();
                    this._errorLayout = null;
                }
                super.dispose();
            }
        }

        public function initialize():void
        {
            var _local_3:Array;
            var _local_4:int;
            var _local_5:String;
            this._isInitialized = true;
            var k:IDesktopWindow = _Str_2277.getDesktop(0);
            var _local_2:IWindow = k.getChildByName("hotel_view_welcome_window");
            if (_local_2 != null)
            {
                k.removeChild(_local_2);
                _local_2.dispose();
            }
            if (((this._Str_7478) && (getBoolean("landing.view.new_identity_override_enabled"))))
            {
                _local_3 = getProperty("landing.view.new_identity_widgets").split(",");
                _local_4 = 1;
                while (_local_4 <= 6)
                {
                    _local_5 = (("landing.view.dynamic.slot." + _local_4) + ".");
                    if (((_local_4 == 1) || (_local_4 == 6)))
                    {
                        setProperty((_local_5 + "widget"), "");
                    }
                    else
                    {
                        setProperty((_local_5 + "widget"), "widgetcontainer");
                        setProperty((_local_5 + "conf"), ("2001-01-01 00:00," + _local_3[(_local_4 - 2)]));
                    }
                    _local_4++;
                }
                setProperty("landing.view.dynamic.leftPaneWidth", "400");
                setProperty("landing.view.dynamic.rightPaneWidth", "400");
            }
            this._landingViewLayout = new _Str_3695(this);
            this.activate();
            if (this._Str_13959())
            {
                this._Str_23627();
            }
        }

        public function activate():void
        {
            if (!this._isInitialized)
            {
                this._Str_15971();
            }
            if (this._toolbar)
            {
                this._toolbar.updateVisibility(HabboToolbarEnum.HTE_STATE_HOTEL_VIEW);
            }
            if (this._landingViewLayout != null)
            {
                this._landingViewLayout.activate();
            }
            else
            {
                Logger.log("ERROR - Landing view layout is not initialized and cannot be activated - See caught errors in tryInitialize()");
            }
        }

        public function disable():void
        {
            if (this._landingViewLayout != null)
            {
                this._landingViewLayout.disable();
                this._Str_17047 = false;
            }
        }

        public function get _Str_24563():Boolean
        {
            return ((!(this._landingViewLayout == null)) && (!(this._landingViewLayout.window == null))) && (this._landingViewLayout.window.visible);
        }

        public function send(k:IMessageComposer):void
        {
            if (this._communicationManager)
            {
                this._communicationManager.connection.send(k);
            }
        }

        private function onToolbarClick(k:HabboToolbarEvent):void
        {
            switch (k._Str_3378)
            {
                case HabboToolbarIconEnum.RECEPTION:
                    if (this._roomSessionManager.getSession(-1))
                    {
                        this.send(new _Str_3719());
                        this._roomSessionManager._Str_7613(-1);
                    }
                    return;
                case HabboToolbarIconEnum.GAMES:
                    if (getBoolean("game.center.enabled"))
                    {
                        this.disable();
                    }
                    return;
            }
        }

        private function _Str_23862(k:GameCenterEvent):void
        {
            if (!this._gameCenterOK)
            {
                this._gameCenterOK = true;
                this._Str_15971();
            }
        }

        override protected function initComponent():void
        {
            this._toolbar.events.addEventListener(HabboToolbarEvent.HTE_TOOLBAR_CLICK, this.onToolbarClick);
            this._catalog.events.addEventListener(CatalogEvent.CATALOG_INVISIBLE_PAGE_VISITED, this._Str_24288);
            if (this._Str_13959())
            {
                this._gameManager.events.addEventListener(GameCenterEvent.GAME_CONFIGURATIONS_INITIALIZED, this._Str_23862);
            }
            else
            {
                this._communicationManager.addHabboConnectionMessageEvent(new _Str_5633(this._Str_18511));
            }
        }

        private function _Str_24288(k:CatalogEvent):void
        {
            if (((((this._isInitialized) && (!(this._landingViewLayout == null))) && (!(this._landingViewLayout.window == null))) && (this._landingViewLayout.window.visible)))
            {
                this.activate();
            }
        }

        private function _Str_18511(k:_Str_5633):void
        {
            if (k.getParser()._Str_17213 <= 0)
            {
                this._Str_15971();
            }
        }

        private function _Str_15971():void
        {
            if (((!(this._Str_13959())) || (this._gameCenterOK)))
            {
                this._errorLayout = this.getXmlWindow("initialization_error");
                this._errorLayout.visible = false;
                try
                {
                    this.initialize();
                    IWindowContainer(this._errorLayout.parent).removeChild(this._errorLayout);
                }
                catch(e:Error)
                {
                    ErrorReportStorage.addDebugData("HabboLandingView", "Landing view layout initialization failed!");
                    _landingViewLayout.dispose();
                    _landingViewLayout = null;
                    windowManager.getDesktop(0).addChild(_errorLayout);
                    _errorLayout.center();
                    _errorLayout.visible = true;
                    context.root.error((e.message + " Landing view initialization failed because of a Flash Error. Landing view removed and disposed!"), false, e.errorID);
                }
            }
        }

        public function getXmlWindow(name:String, layer:uint=1):IWindow
        {
            var asset:IAsset;
            var xmlAsset:XmlAsset;
            var window:IWindow;
            try
            {
                asset = assets.getAssetByName((name + "_xml"));
                xmlAsset = XmlAsset(asset);
                if (((asset == null) || (xmlAsset == null)))
                {
                    return null;
                }
                window = _Str_2277.buildFromXML(XML(xmlAsset.content), layer);
            }
            catch(e:Error)
            {
                ErrorReportStorage.addDebugData("HabboLandingView", (("Failed to build window " + name) + "_xml!"));
                throw (e);
            }
            return window;
        }

        public function goToRoom(k:String=null):void
        {
            if (k == null)
            {
                k = getProperty("landing.view.roomcategory");
            }
            if (k != null)
            {
                this.send(new _Str_12081(k));
            }
        }

        public function getProductData(k:String, _arg_2:IProductDataListener):IProductData
        {
            if (_Str_2318.loadProductData(_arg_2))
            {
                return _Str_2318.getProductData(k);
            }
            return null;
        }

        public function get _Str_2602():IHabboHelp
        {
            return this._habboHelp;
        }

        public function openGameCenterByGameName(k:String):void
        {
            if (this._gameManager)
            {
                this._gameManager.showGameCenterByGameName("showGameCenter.landingView", k);
                this.disable();
            }
        }

        public function _Str_26103(k:int):void
        {
            if (this._gameManager)
            {
                this._gameManager.showGameCenter("showGameCenter.landingView", k);
                this.disable();
            }
        }

        public function openGameCenter():void
        {
            if (this._gameManager)
            {
                this._gameManager.showGameCenter("showGameCenter.landingView");
                this.disable();
            }
        }

        public function requestBadge(k:String):void
        {
            this.send(new _Str_11090(k));
        }

        public function communityGoalVote(k:int):void
        {
            this.send(new _Str_11999(k));
        }

        public function get sessionDataManager():ISessionDataManager
        {
            return _Str_2318;
        }

        private function _Str_13959():Boolean
        {
            return propertyExists("game.name");
        }

        private function _Str_23627():void
        {
            var k:String;
            if (this._gameManager)
            {
                if (this._Str_13959())
                {
                    k = getProperty("game.name");
                    if (((k) && (!(k == "default"))))
                    {
                        this._gameManager.showGameCenterByGameName("showGameCenter.gameCenterForward", k, (k == "elisa_habbo_stories"));
                    }
                    else
                    {
                        this._gameManager.showGameCenter("showGameCenter.gameCenterForward");
                    }
                }
            }
        }

        public function set _Str_17047(k:Boolean):void
        {
            if (((this._toolbar) && (this._toolbar.extensionView)))
            {
                this._toolbar.extensionView.extraMargin = ((k) ? HabboToolbarEnum._Str_18620 : 0);
            }
        }

        public function get _Str_7478():Boolean
        {
            return getInteger("new.identity", 0) > 0;
        }

        public function get _Str_11168():int
        {
            return getInteger("landing.view.dynamic.leftPaneWidth", 500);
        }

        public function get _Str_9931():int
        {
            return getInteger("landing.view.dynamic.rightPaneWidth", 250);
        }

        public function get avatarEditor():IHabboAvatarEditor
        {
            return this._avatarEditor;
        }

        public function get roomEngine():IRoomEngine
        {
            return this._roomEngine;
        }
    }
}
