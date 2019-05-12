package com.sulake.habbo.notifications
{
    import com.sulake.core.runtime.Component;
    import com.sulake.habbo.communication.IHabboCommunicationManager;
	import com.sulake.habbo.notifications.singular.MOTDNotification;
    import com.sulake.habbo.session.ISessionDataManager;
    import com.sulake.habbo.window.IHabboWindowManager;
    import com.sulake.habbo.localization.IHabboLocalizationManager;
    import com.sulake.habbo.inventory.IHabboInventory;
    import com.sulake.habbo.friendlist.IHabboFriendsList;
    import com.sulake.habbo.room.IRoomEngine;
    import com.sulake.habbo.catalog.IHabboCatalog;
    import com.sulake.habbo.toolbar.IHabboToolbar;
    import com.sulake.habbo.notifications.utils.ProductImageUtility;
    import com.sulake.habbo.notifications.utils.PetImageUtility;
    import com.sulake.habbo.session.IRoomSessionManager;
    import com.sulake.habbo.help.IHabboHelp;
    import com.sulake.habbo.notifications.feed.NotificationController;
    import com.sulake.habbo.notifications.singular.SingularNotificationController;
    import com.sulake.core.runtime.IContext;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.core.runtime.ComponentDependency;
    import com.sulake.iid.IIDHabboInventory;
    import com.sulake.iid.IIDHabboFriendList;
    import com.sulake.iid.IIDSessionDataManager;
    import com.sulake.iid.IIDHabboCommunicationManager;
    import com.sulake.iid.IIDRoomEngine;
    import com.sulake.iid.IIDHabboCatalog;
    import com.sulake.habbo.catalog.event.CatalogEvent;
    import com.sulake.iid.IIDHabboToolbar;
    import com.sulake.iid.IIDHabboLocalizationManager;
    import com.sulake.iid.IIDHabboWindowManager;
    import com.sulake.iid.IIDHabboRoomSessionManager;
    import com.sulake.iid.IIDHabboHelp;
    import __AS3__.vec.Vector;
    import com.sulake.habbo.communication.messages.outgoing.users._Str_11544;
    import com.sulake.core.utils.Map;
    import adobe.serialization.json.JSONDecoder;

    public class HabboNotifications extends Component implements IHabboNotifications 
    {
        private var _communication:IHabboCommunicationManager;
        private var _sessionDataManager:ISessionDataManager;
        private var _windowManager:IHabboWindowManager;
        private var _localization:IHabboLocalizationManager;
        private var _inventory:IHabboInventory;
        private var _friendList:IHabboFriendsList;
        private var _roomEngine:IRoomEngine;
        private var _catalog:IHabboCatalog;
        private var _toolBar:IHabboToolbar;
        private var _productImageUtility:ProductImageUtility;
        private var _petImageUtility:PetImageUtility;
        private var _roomSessionManager:IRoomSessionManager;
        private var _habboHelp:IHabboHelp;
        private var _feedController:NotificationController;
        private var _singularController:SingularNotificationController;
        private var _incoming:IncomingMessages;
        private var _disabled:Boolean;

        public function HabboNotifications(k:IContext, _arg_2:uint=0, _arg_3:IAssetLibrary=null)
        {
            super(k, _arg_2, _arg_3);
            this._disabled = false;
        }

        public function get assetLibrary():IAssetLibrary
        {
            return assets;
        }

        public function get windowManager():IHabboWindowManager
        {
            return this._windowManager;
        }

        public function get localization():IHabboLocalizationManager
        {
            return this._localization;
        }

        public function get sessionDataManager():ISessionDataManager
        {
            return this._sessionDataManager;
        }

        public function get roomSessionManager():IRoomSessionManager
        {
            return this._roomSessionManager;
        }

        public function get catalog():IHabboCatalog
        {
            return this._catalog;
        }

        public function get _Str_9496():IHabboToolbar
        {
            return this._toolBar;
        }

        public function get _Str_2602():IHabboHelp
        {
            return this._habboHelp;
        }

        public function get _Str_3069():SingularNotificationController
        {
            return this._singularController;
        }

        public function get _Str_16215():NotificationController
        {
            return this._feedController;
        }

        public function get disabled():Boolean
        {
            return this._disabled;
        }

        public function set disabled(k:Boolean):void
        {
            this._disabled = k;
        }

        public function get _Str_24642():ProductImageUtility
        {
            if (((this._roomEngine == null) || (this._inventory == null)))
            {
                return null;
            }
            if (this._productImageUtility == null)
            {
                this._productImageUtility = new ProductImageUtility(this._roomEngine, this._inventory);
            }
            return this._productImageUtility;
        }

        public function get _Str_21924():PetImageUtility
        {
            if (this._roomEngine == null)
            {
                return null;
            }
            if (this._petImageUtility == null)
            {
                this._petImageUtility = new PetImageUtility(this._roomEngine);
            }
            return this._petImageUtility;
        }

        override protected function get dependencies():Vector.<ComponentDependency>
        {
            return (super.dependencies.concat(new <ComponentDependency>[new ComponentDependency(new IIDHabboInventory(), function (k:IHabboInventory):void
            {
                _inventory = k;
            }, false), new ComponentDependency(new IIDHabboFriendList(), function (k:IHabboFriendsList):void
            {
                _friendList = k;
            }, false), new ComponentDependency(new IIDSessionDataManager(), function (k:ISessionDataManager):void
            {
                _sessionDataManager = k;
            }), new ComponentDependency(new IIDHabboCommunicationManager(), function (k:IHabboCommunicationManager):void
            {
                _communication = k;
            }), new ComponentDependency(new IIDRoomEngine(), function (k:IRoomEngine):void
            {
                _roomEngine = k;
            }, false), new ComponentDependency(new IIDHabboCatalog(), function (k:IHabboCatalog):void
            {
                _catalog = k;
            }, false, [{
                "type":CatalogEvent.CATALOG_BUILDER_MEMBERSHIP_EXPIRED,
                "callback":this._Str_24508
            }, {
                "type":CatalogEvent.CATALOG_BUILDER_MEMBERSHIP_IN_GRACE,
                "callback":this._Str_25671
            }]), new ComponentDependency(new IIDHabboToolbar(), function (k:IHabboToolbar):void
            {
                _toolBar = k;
            }), new ComponentDependency(new IIDHabboLocalizationManager(), function (k:IHabboLocalizationManager):void
            {
                _localization = k;
            }), new ComponentDependency(new IIDHabboWindowManager(), function (k:IHabboWindowManager):void
            {
                _windowManager = k;
            }), new ComponentDependency(new IIDHabboRoomSessionManager(), function (k:IRoomSessionManager):void
            {
                _roomSessionManager = k;
            }, false), new ComponentDependency(new IIDHabboHelp(), function (k:IHabboHelp):void
            {
                _habboHelp = k;
            })]));
        }

        override protected function initComponent():void
        {
            this._singularController = new SingularNotificationController(this);
            this._incoming = new IncomingMessages(this, this._communication);
        }

        override public function dispose():void
        {
            if (disposed)
            {
                return;
            }
            if (this._incoming != null)
            {
                this._incoming.dispose();
                this._incoming = null;
            }
            if (this._feedController != null)
            {
                this._feedController.dispose();
                this._feedController = null;
            }
            if (this._petImageUtility != null)
            {
                this._petImageUtility.dispose();
                this._petImageUtility = null;
            }
            if (this._productImageUtility != null)
            {
                this._productImageUtility.dispose();
                this._productImageUtility = null;
            }
            super.dispose();
        }

        public function activate():void
        {
            if (this._feedController != null)
            {
                this._feedController._Str_23337(true);
            }
            this._communication.connection.send(new _Str_11544());
        }

        public function _Str_15846(k:String, _arg_2:String):void
        {
            this._singularController._Str_15846(k, _arg_2);
        }

        public function _Str_10093(k:String, _arg_2:Map=null):void
        {
            var _local_4:Object;
            var _local_5:String;
            var _local_6:String;
            var _local_7:String;
            var _local_8:Boolean;
            var _local_9:String;
            if (_arg_2 == null)
            {
                _arg_2 = new Map();
            }
            var _local_3:String = ("notification." + k);
            if (propertyExists(_local_3))
            {
                _local_4 = new JSONDecoder(getProperty(_local_3), true).getValue();
                for (_local_5 in _local_4)
                {
                    _arg_2[_local_5] = _local_4[_local_5];
                }
            }
            if (_arg_2["display"] == "BUBBLE")
            {
                _local_6 = this._Str_5512(_arg_2, k, "message", true);
                _local_7 = this._Str_5512(_arg_2, k, "linkUrl", false);
                _local_8 = ((!(_local_7 == null)) && (_local_7.substr(0, 6) == "event:"));
                _local_9 = this._Str_20214(_arg_2, k);
                this._singularController._Str_2822(_local_6, NotificationType.INFO, null, _local_9, null, ((_local_8) ? _local_7.substr(6) : _local_7));
            }
            else
            {
                new MOTDNotification(this, k, _arg_2);
            }
        }

        public function _Str_5512(k:Map, _arg_2:String, _arg_3:String, _arg_4:Boolean):String
        {
            var _local_5:String;
            if (k.hasKey(_arg_3))
            {
                return k.getValue(_arg_3);
            }
            _local_5 = ["notification", _arg_2, _arg_3].join(".");
            if (((this.localization.hasLocalization(_local_5)) || (_arg_4)))
            {
                return this.localization._Str_21551(_local_5, _local_5, k);
            }
            return null;
        }

        public function _Str_20214(k:Map, _arg_2:String):String
        {
            var _local_3:String = k.getValue("image");
            if (_local_3 == null)
            {
                _local_3 = (("${image.library.url}notifications/" + _arg_2.replace(/\./g, "_")) + ".png");
            }
            return _local_3;
        }

        private function _Str_25671(k:CatalogEvent):void
        {
            this._Str_10093("builders_club.membership_in_grace", null);
        }

        private function _Str_24508(k:CatalogEvent):void
        {
            this._Str_10093("builders_club.membership_expired", null);
        }

        public function createLinkEvent(k:String):void
        {
            context.createLinkEvent(k);
        }
    }
}
