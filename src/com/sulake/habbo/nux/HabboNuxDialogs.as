package com.sulake.habbo.nux
{
    import com.sulake.core.runtime.Component;
    import com.sulake.core.runtime.events.ILinkEventTracker;
    import com.sulake.habbo.communication.IHabboCommunicationManager;
    import com.sulake.habbo.navigator.IHabboNavigator;
    import com.sulake.habbo.window.IHabboWindowManager;
    import com.sulake.habbo.localization.IHabboLocalizationManager;
    import com.sulake.habbo.catalog.IHabboCatalog;
    import com.sulake.habbo.session.ISessionDataManager;
    import com.sulake.habbo.session.IRoomSessionManager;
    import com.sulake.core.communication.connection.IConnection;
    import flash.utils.Timer;
    import com.sulake.core.runtime.IContext;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.core.runtime.ComponentDependency;
    import com.sulake.iid.IIDHabboCommunicationManager;
    import com.sulake.iid.IIDHabboWindowManager;
    import com.sulake.iid.IIDHabboNavigator;
    import com.sulake.iid.IIDHabboLocalizationManager;
    import com.sulake.iid.IIDHabboCatalog;
    import com.sulake.iid.IIDSessionDataManager;
    import com.sulake.iid.IIDHabboRoomSessionManager;
    import com.sulake.habbo.session.events.RoomSessionEvent;
    import __AS3__.vec.Vector;
    import com.sulake.habbo.communication.messages.incoming.nux.NewUserExperienceNotCompleteEvent;
    import com.sulake.habbo.communication.messages.incoming.nux.NewUserExperienceGiftOfferEvent;
    import com.sulake.habbo.communication.messages.outgoing.gifts.SetPhoneNumberVerificationStatusMessageComposer;
    import com.sulake.habbo.phonenumber.ClientPhoneVerificationStatusEnum;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.habbo.window.utils.IConfirmDialog;
    import com.sulake.habbo.communication.messages.outgoing.nux.NewUserExperienceGetGiftsMessageComposer;
    import com.sulake.habbo.communication.messages.outgoing.nux.NewUserExperienceGetGiftsSelection;
    import com.sulake.habbo.communication.messages.parser.nux.NewUserExperienceGiftOfferParser;
    import flash.events.TimerEvent;
    import com.sulake.core.runtime.IHabboConfigurationManager;
    import com.sulake.habbo.communication.messages.incoming.nux.NewUserExperienceGiftOptions;
    import com.sulake.habbo.communication.messages.outgoing.tracking.EventLogMessageComposer;

    public class HabboNuxDialogs extends Component implements ILinkEventTracker 
    {
        protected var _communicationManager:IHabboCommunicationManager;
        protected var _navigator:IHabboNavigator;
        protected var _windowManager:IHabboWindowManager;
        protected var _localizationManager:IHabboLocalizationManager;
        protected var _catalog:IHabboCatalog;
        protected var _sessionDataManager:ISessionDataManager;
        protected var _roomSessionManager:IRoomSessionManager;
        private var _connection:IConnection;
        private var _Str_14050:NuxOfferOldUserView;
        private var _Str_13375:NuxGiftSelectionView;
        private var _Str_13625:NuxNoobRoomOfferView;
        private var _Str_4439:Timer;

        public function HabboNuxDialogs(k:IContext, _arg_2:uint, _arg_3:IAssetLibrary)
        {
            super(k, _arg_2, _arg_3);
        }

        override protected function get dependencies():Vector.<ComponentDependency>
        {
            return (super.dependencies.concat(new <ComponentDependency>[new ComponentDependency(new IIDHabboCommunicationManager(), function (k:IHabboCommunicationManager):void
            {
                _communicationManager = k;
            }, true), new ComponentDependency(new IIDHabboWindowManager(), function (k:IHabboWindowManager):void
            {
                _windowManager = k;
            }), new ComponentDependency(new IIDHabboNavigator(), function (k:IHabboNavigator):void
            {
                _navigator = k;
            }), new ComponentDependency(new IIDHabboLocalizationManager(), function (k:IHabboLocalizationManager):void
            {
                _localizationManager = k;
            }), new ComponentDependency(new IIDHabboCatalog(), function (k:IHabboCatalog):void
            {
                _catalog = k;
            }), new ComponentDependency(new IIDSessionDataManager(), function (k:ISessionDataManager):void
            {
                _sessionDataManager = k;
            }), new ComponentDependency(new IIDHabboRoomSessionManager(), function (k:IRoomSessionManager):void
            {
                _roomSessionManager = k;
            }, false, [{
                "type":RoomSessionEvent.STARTED,
                "callback":this.onRoomSessionEvent
            }, {
                "type":RoomSessionEvent.ENDED,
                "callback":this.onRoomSessionEvent
            }])]));
        }

        override public function dispose():void
        {
            context.removeLinkEventTracker(this);
            if (this._windowManager)
            {
                this._windowManager = null;
            }
            this.destroyGiftSelectionView();
            this.destroyNoobRoomOfferView();
            this.destroyNuxOfferView();
            super.dispose();
        }

        override protected function initComponent():void
        {
            this._connection = this._communicationManager.connection;
            if (this._connection)
            {
                this._connection.addMessageEvent(new NewUserExperienceNotCompleteEvent(this.onNewUserExperienceNotCompleteMessage));
                this._connection.addMessageEvent(new NewUserExperienceGiftOfferEvent(this.onNewUserExperienceGiftOfferMessage));
            }
            context.addLinkEventTracker(this);
        }

        public function get linkPattern():String
        {
            return "nux/";
        }

        public function linkReceived(k:String):void
        {
            var _local_2:Array = k.split("/");
            if (_local_2.length < 2)
            {
                return;
            }
            switch (_local_2[1])
            {
                case "lobbyoffer":
                    if (((_local_2.length > 2) && (_local_2[2] == "show")))
                    {
                        this.createNoobRoomOfferView();
                    }
                    else
                    {
                        this.destroyNoobRoomOfferView();
                    }
                    return;
                default:
                    Logger.log(("HabboNuxDialogs unknown link-type received: " + _local_2[1]));
            }
        }

        public function onVerify():void
        {
            this._connection.send(new SetPhoneNumberVerificationStatusMessageComposer(ClientPhoneVerificationStatusEnum.NON_EXISTING));
        }

        public function onReject():void
        {
            this._windowManager.confirm("${phone.number.never.again.confirm.title}", "${phone.number.never.again.confirm.text}", 0, this.onNeverAgainConfirmClose);
        }

        private function onNeverAgainConfirmClose(k:IConfirmDialog, _arg_2:WindowEvent):void
        {
            k.dispose();
            if (((_arg_2.type == WindowEvent.WINDOW_EVENT_OK) && (this._connection)))
            {
                this.destroyNuxOfferView();
                this._connection.send(new SetPhoneNumberVerificationStatusMessageComposer(ClientPhoneVerificationStatusEnum.NEVER_AGAIN));
            }
        }

        public function onSendGetGifts(k:Vector.<NewUserExperienceGetGiftsSelection>):void
        {
            this.destroyGiftSelectionView();
            this._connection.send(new NewUserExperienceGetGiftsMessageComposer(k));
        }

        private function onNewUserExperienceNotCompleteMessage(k:NewUserExperienceNotCompleteEvent):void
        {
            this.createNuxOfferView();
        }

        private function onNewUserExperienceGiftOfferMessage(k:NewUserExperienceGiftOfferEvent):void
        {
            var _local_2:NewUserExperienceGiftOfferParser = k.getParser();
            this.createGiftSelectionView(_local_2.giftOptions);
        }

        private function onRoomSessionEvent(k:RoomSessionEvent):void
        {
            var _local_2:uint;
            if (((!(getBoolean("nux.lobbies.enabled"))) || (!(this._sessionDataManager.isRealNoob))))
            {
                return;
            }
            if ((((k.type == RoomSessionEvent.STARTED) && (k.session)) && (k.session.roomId == this._navigator.homeRoomId)))
            {
                _local_2 = (getInteger("nux.noob.lobby.popup.delay", 70) * 1000);
                this._Str_4439 = new Timer(_local_2, 1);
                this._Str_4439.addEventListener(TimerEvent.TIMER, this.createNoobRoomOfferView);
                this._Str_4439.start();
            }
            else
            {
                this.destroyNoobRoomOfferView();
            }
        }

        public function get windowManager():IHabboWindowManager
        {
            return this._windowManager;
        }

        public function get localizationManager():IHabboLocalizationManager
        {
            return this._localizationManager;
        }

        public function get sessionDataManager():ISessionDataManager
        {
            return this._sessionDataManager;
        }

        public function get configuration():IHabboConfigurationManager
        {
            return this;
        }

        public function get catalog():IHabboCatalog
        {
            return this._catalog;
        }

        private function createNuxOfferView():void
        {
            this.destroyNuxOfferView();
            this._Str_14050 = new NuxOfferOldUserView(this);
        }

        public function destroyNuxOfferView():void
        {
            if (this._Str_14050)
            {
                this._Str_14050.dispose();
                this._Str_14050 = null;
            }
        }

        private function createGiftSelectionView(k:Vector.<NewUserExperienceGiftOptions>):void
        {
            this.destroyGiftSelectionView();
            this._Str_13375 = new NuxGiftSelectionView(this, k);
        }

        private function destroyGiftSelectionView():void
        {
            if (this._Str_13375)
            {
                this._Str_13375.dispose();
                this._Str_13375 = null;
            }
        }

        private function startNoobRoomOfferTimer():void
        {
        }

        private function createNoobRoomOfferView(k:TimerEvent=null):void
        {
            if (((!(getBoolean("nux.lobbies.enabled"))) || (!(this._sessionDataManager.isRealNoob))))
            {
                return;
            }
            this.destroyNoobRoomOfferView();
            this._Str_13625 = new NuxNoobRoomOfferView(this);
            this._connection.send(new EventLogMessageComposer("NewNavigator", "nux.offer.lobby", "nux.offer.lobby"));
        }

        public function destroyNoobRoomOfferView():void
        {
            if (this._Str_4439)
            {
                this._Str_4439.reset();
                this._Str_4439 = null;
            }
            if (this._Str_13625)
            {
                this._Str_13625.dispose();
                this._Str_13625 = null;
            }
        }
    }
}
