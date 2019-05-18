package com.sulake.habbo.friendbar.talent
{
    import com.sulake.habbo.friendbar.view.AbstractView;
    import com.sulake.habbo.friendbar.IHabboTalent;
    import com.sulake.core.runtime.events.ILinkEventTracker;
    import com.sulake.habbo.communication.IHabboCommunicationManager;
    import com.sulake.habbo.help.IHabboHelp;
    import com.sulake.habbo.navigator.IHabboNavigator;
    import com.sulake.habbo.toolbar.IHabboToolbar;
    import com.sulake.habbo.avatar.IHabboAvatarEditor;
    import com.sulake.core.runtime.IContext;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.habbo.localization.IHabboLocalizationManager;
    import com.sulake.habbo.session.ISessionDataManager;
    import com.sulake.habbo.tracking.IHabboTracking;
    import com.sulake.habbo.window.IHabboWindowManager;
    import com.sulake.core.runtime.ComponentDependency;
    import com.sulake.iid.IIDHabboCommunicationManager;
    import com.sulake.iid.IIDHabboHelp;
    import com.sulake.iid.IIDHabboNavigator;
    import com.sulake.iid.IIDHabboToolbar;
    import com.sulake.iid.IIDHabboAvatarEditor;
    import __AS3__.vec.Vector;
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.assets.IAsset;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.utils.ErrorReportStorage;
    import com.sulake.habbo.window.utils._Str_2784;
    import com.sulake.habbo.communication.messages.parser.talent.TalentTrackLevel;
    import com.sulake.habbo.session.talent.TalentEnum;
    import com.sulake.habbo.communication.messages.outgoing._Str_364._Str_3075;

    public class HabboTalent extends AbstractView implements IHabboTalent, ILinkEventTracker 
    {
        private var _talentTrack:TalentTrackController;
        private var _talentLevelUp:TalentLevelUpController;
        private var _talentPromo:TalentPromoCtrl;
        private var _citizenshipPopup:CitizenshipPopupController;
        private var _communicationManager:IHabboCommunicationManager;
        private var _habboHelp:IHabboHelp;
        private var _navigator:IHabboNavigator;
        private var _toolbar:IHabboToolbar;
        private var _avatarEditor:IHabboAvatarEditor;

        public function HabboTalent(k:IContext, _arg_2:uint, _arg_3:IAssetLibrary)
        {
            super(k, _arg_2, _arg_3);
        }

        public function get communicationManager():IHabboCommunicationManager
        {
            return this._communicationManager;
        }

        public function get localizationManager():IHabboLocalizationManager
        {
            return _Str_2904;
        }

        public function get _Str_20410():ISessionDataManager
        {
            return _Str_2318;
        }

        public function get tracking():IHabboTracking
        {
            return habboTracking;
        }

        public function get windowManager():IHabboWindowManager
        {
            return _Str_2277;
        }

        public function get _Str_2602():IHabboHelp
        {
            return this._habboHelp;
        }

        public function get navigator():IHabboNavigator
        {
            return this._navigator;
        }

        public function get _Str_24706():Boolean
        {
            return getBoolean("talent.track.enabled");
        }

        public function get _Str_9968():Boolean
        {
            return getBoolean("talent.track.citizenship.enabled");
        }

        public function get _Str_19829():Boolean
        {
            return getBoolean("guide.help.new.user.tour.enabled");
        }

        public function get _Str_7478():Boolean
        {
            return getInteger("new.identity", 0) > 0;
        }

        public function get toolbar():IHabboToolbar
        {
            return this._toolbar;
        }

        public function get avatarEditor():IHabboAvatarEditor
        {
            return this._avatarEditor;
        }

        override protected function get dependencies():Vector.<ComponentDependency>
        {
            return (super.dependencies.concat(new <ComponentDependency>[new ComponentDependency(new IIDHabboCommunicationManager(), function (k:IHabboCommunicationManager):void
            {
                _communicationManager = k;
            }), new ComponentDependency(new IIDHabboHelp(), function (k:IHabboHelp):void
            {
                _habboHelp = k;
            }), new ComponentDependency(new IIDHabboNavigator(), function (k:IHabboNavigator):void
            {
                _navigator = k;
            }), new ComponentDependency(new IIDHabboToolbar(), function (k:IHabboToolbar):void
            {
                _toolbar = k;
            }), new ComponentDependency(new IIDHabboAvatarEditor(), function (k:IHabboAvatarEditor):void
            {
                _avatarEditor = k;
            })]));
        }

        override public function dispose():void
        {
            if (!disposed)
            {
                if (this._talentLevelUp)
                {
                    this._talentLevelUp.dispose();
                    this._talentLevelUp = null;
                }
                if (this._talentTrack)
                {
                    this._talentTrack.dispose();
                    this._talentTrack = null;
                }
                if (this._talentPromo)
                {
                    this._talentPromo.dispose();
                    this._talentPromo = null;
                }
                if (this._citizenshipPopup != null)
                {
                    this._citizenshipPopup.dispose();
                    this._citizenshipPopup = null;
                }
                context.removeLinkEventTracker(this);
                super.dispose();
            }
        }

        override protected function initComponent():void
        {
            if (!this._Str_24706)
            {
                return;
            }
            this._talentTrack = new TalentTrackController(this);
            this._talentLevelUp = new TalentLevelUpController(this);
            this._talentPromo = new TalentPromoCtrl(this);
            if (this._Str_9968)
            {
                this._citizenshipPopup = new CitizenshipPopupController(this);
            }
            context.addLinkEventTracker(this);
            this._talentTrack.initialize();
            this._talentLevelUp.initialize();
            this._talentPromo.initialize();
        }

        public function send(k:IMessageComposer):void
        {
            if (this._communicationManager)
            {
                this._communicationManager.connection.send(k);
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
                window = _Str_2277.buildFromXML(XML(xmlAsset.content), layer);
            }
            catch(e:Error)
            {
                ErrorReportStorage.addDebugData("HabboTalent", (((((("Failed to build window " + name) + "_xml, ") + asset) + ", ") + _Str_2277) + "!"));
                throw (e);
            }
            return window;
        }

        public function _Str_4804(name:String):_Str_2784
        {
            var asset:IAsset;
            var xmlAsset:XmlAsset;
            var dialog:_Str_2784;
            try
            {
                asset = assets.getAssetByName((name + "_xml"));
                xmlAsset = XmlAsset(asset);
                dialog = _Str_2277.buildModalDialogFromXML(XML(xmlAsset.content));
            }
            catch(e:Error)
            {
                ErrorReportStorage.addDebugData("HabboTalent", (((((("Failed to build window " + name) + "_xml, ") + asset) + ", ") + _Str_2277) + "!"));
                throw (e);
            }
            return dialog;
        }

        public function _Str_26419(k:String, _arg_2:TalentTrackLevel):void
        {
            this._talentLevelUp._Str_3360(k, _arg_2.level, _arg_2._Str_8893, _arg_2._Str_7068);
        }

        public function get eventUrlPrefix():String
        {
            return "talent/";
        }

        public function linkReceived(k:String):void
        {
            var _local_3:String;
            var _local_2:Array = k.split("/");
            if (_local_2.length < 2)
            {
                return;
            }
            switch (_local_2[1])
            {
                case "open":
                    if (_local_2.length > 2)
                    {
                        _local_3 = _local_2[2];
                        switch (_local_3)
                        {
                            case TalentEnum.CITIZENSHIP:
                                habboTracking.trackTalentTrackOpen(TalentEnum.CITIZENSHIP, "citizenshiplink");
                                this.send(new _Str_3075(TalentEnum.CITIZENSHIP));
                                break;
                            case TalentEnum.HELPER:
                                habboTracking.trackTalentTrackOpen(TalentEnum.HELPER, "helperlink");
                                this.send(new _Str_3075(TalentEnum.HELPER));
                                break;
                        }
                    }
                    return;
                default:
                    Logger.log(("Catalog unknown link-type receive: " + _local_2[1]));
            }
        }
    }
}
