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
    import com.sulake.habbo.communication.messages.incoming.nux._Str_8454;
    import com.sulake.habbo.communication.messages.incoming.nux._Str_8566;
    import com.sulake.habbo.communication.messages.outgoing._Str_391._Str_6202;
    import com.sulake.habbo.phonenumber.ClientPhoneVerificationStatusEnum;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.habbo.window.utils._Str_2910;
    import com.sulake.habbo.communication.messages.outgoing._Str_428._Str_11372;
    import com.sulake.habbo.communication.messages.outgoing._Str_428._Str_4584;
    import com.sulake.habbo.communication.messages.parser.nux.NewUserExperienceGiftOfferParser;
    import flash.events.TimerEvent;
    import com.sulake.core.runtime.IHabboConfigurationManager;
    import com.sulake.habbo.communication.messages.incoming.nux.NewUserExperienceGiftOptions;
    import com.sulake.habbo.communication.messages.outgoing.tracking.EventLogMessageComposer;

    public class HabboNuxDialogs extends Component implements ILinkEventTracker 
    {
        protected var _Str_2355:IHabboCommunicationManager;
        protected var _Str_2272:IHabboNavigator;
        protected var _Str_2277:IHabboWindowManager;
        protected var _Str_2904:IHabboLocalizationManager;
        protected var _Str_2276:IHabboCatalog;
        protected var _Str_2318:ISessionDataManager;
        protected var _Str_2422:IRoomSessionManager;
        private var _Str_2310:IConnection;
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
                _Str_2355 = k;
            }, true), new ComponentDependency(new IIDHabboWindowManager(), function (k:IHabboWindowManager):void
            {
                _Str_2277 = k;
            }), new ComponentDependency(new IIDHabboNavigator(), function (k:IHabboNavigator):void
            {
                _Str_2272 = k;
            }), new ComponentDependency(new IIDHabboLocalizationManager(), function (k:IHabboLocalizationManager):void
            {
                _Str_2904 = k;
            }), new ComponentDependency(new IIDHabboCatalog(), function (k:IHabboCatalog):void
            {
                _Str_2276 = k;
            }), new ComponentDependency(new IIDSessionDataManager(), function (k:ISessionDataManager):void
            {
                _Str_2318 = k;
            }), new ComponentDependency(new IIDHabboRoomSessionManager(), function (k:IRoomSessionManager):void
            {
                _Str_2422 = k;
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
            if (this._Str_2277)
            {
                this._Str_2277 = null;
            }
            this._Str_17452();
            this._Str_11922();
            this._Str_8646();
            super.dispose();
        }

        override protected function initComponent():void
        {
            this._Str_2310 = this._Str_2355.connection;
            if (this._Str_2310)
            {
                this._Str_2310.addMessageEvent(new _Str_8454(this._Str_23208));
                this._Str_2310.addMessageEvent(new _Str_8566(this._Str_22466));
            }
            context.addLinkEventTracker(this);
        }

        public function get eventUrlPrefix():String
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
                        this._Str_21884();
                    }
                    else
                    {
                        this._Str_11922();
                    }
                    return;
                default:
                    Logger.log(("HabboNuxDialogs unknown link-type received: " + _local_2[1]));
            }
        }

        public function _Str_17239():void
        {
            this._Str_2310.send(new _Str_6202(ClientPhoneVerificationStatusEnum._Str_4917));
        }

        public function _Str_19003():void
        {
            this._Str_2277.confirm("${phone.number.never.again.confirm.title}", "${phone.number.never.again.confirm.text}", 0, this._Str_16253);
        }

        private function _Str_16253(k:_Str_2910, _arg_2:WindowEvent):void
        {
            k.dispose();
            if (((_arg_2.type == WindowEvent.WINDOW_EVENT_OK) && (this._Str_2310)))
            {
                this._Str_8646();
                this._Str_2310.send(new _Str_6202(ClientPhoneVerificationStatusEnum._Str_9095));
            }
        }

        public function _Str_25203(k:Vector.<_Str_4584>):void
        {
            this._Str_17452();
            this._Str_2310.send(new _Str_11372(k));
        }

        private function _Str_23208(k:_Str_8454):void
        {
            this._Str_22781();
        }

        private function _Str_22466(k:_Str_8566):void
        {
            var _local_2:NewUserExperienceGiftOfferParser = k.getParser();
            this._Str_24881(_local_2.giftOptions);
        }

        private function onRoomSessionEvent(k:RoomSessionEvent):void
        {
            var _local_2:uint;
            if (((!(getBoolean("nux.lobbies.enabled"))) || (!(this._Str_2318.isAnyRoomController))))
            {
                return;
            }
            if ((((k.type == RoomSessionEvent.STARTED) && (k.session)) && (k.session.roomId == this._Str_2272.homeRoomId)))
            {
                _local_2 = (getInteger("nux.noob.lobby.popup.delay", 70) * 1000);
                this._Str_4439 = new Timer(_local_2, 1);
                this._Str_4439.addEventListener(TimerEvent.TIMER, this._Str_21884);
                this._Str_4439.start();
            }
            else
            {
                this._Str_11922();
            }
        }

        public function get windowManager():IHabboWindowManager
        {
            return this._Str_2277;
        }

        public function get localizationManager():IHabboLocalizationManager
        {
            return this._Str_2904;
        }

        public function get sessionDataManager():ISessionDataManager
        {
            return this._Str_2318;
        }

        public function get configuration():IHabboConfigurationManager
        {
            return this;
        }

        public function get catalog():IHabboCatalog
        {
            return this._Str_2276;
        }

        private function _Str_22781():void
        {
            this._Str_8646();
            this._Str_14050 = new NuxOfferOldUserView(this);
        }

        public function _Str_8646():void
        {
            if (this._Str_14050)
            {
                this._Str_14050.dispose();
                this._Str_14050 = null;
            }
        }

        private function _Str_24881(k:Vector.<NewUserExperienceGiftOptions>):void
        {
            this._Str_17452();
            this._Str_13375 = new NuxGiftSelectionView(this, k);
        }

        private function _Str_17452():void
        {
            if (this._Str_13375)
            {
                this._Str_13375.dispose();
                this._Str_13375 = null;
            }
        }

        private function _Str_25909():void
        {
        }

        private function _Str_21884(k:TimerEvent=null):void
        {
            if (((!(getBoolean("nux.lobbies.enabled"))) || (!(this._Str_2318.isAnyRoomController))))
            {
                return;
            }
            this._Str_11922();
            this._Str_13625 = new NuxNoobRoomOfferView(this);
            this._Str_2310.send(new EventLogMessageComposer("NewNavigator", "nux.offer.lobby", "nux.offer.lobby"));
        }

        public function _Str_11922():void
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
