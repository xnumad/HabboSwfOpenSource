package com.sulake.habbo.moderation
{
    import com.sulake.core.runtime.Component;
	import com.sulake.habbo.toolbar.IHabboToolbar;
    import com.sulake.habbo.window.IHabboWindowManager;
	import com.sulake.habbo.toolbar.events.HabboToolbarEvent;
	import com.sulake.habbo.avatar.IAvatarRenderManager;
    import com.sulake.habbo.communication.IHabboCommunicationManager;
    import com.sulake.habbo.session.ISessionDataManager;
    import com.sulake.habbo.navigator.IHabboNavigator;
    import com.sulake.habbo.sound.IHabboSoundManager;
    import com.sulake.habbo.tracking.IHabboTracking;
    import com.sulake.habbo.friendbar.IHabboFriendBar;
    import com.sulake.habbo.communication.messages.parser.moderation.ModeratorInitData;
    import com.sulake.core.runtime.IContext;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.core.runtime.ComponentDependency;
	import com.sulake.iid.IIDAvatarRenderManager;
	import com.sulake.iid.IIDHabboToolbar;
    import com.sulake.iid.IIDHabboWindowManager;
    import com.sulake.iid.IIDHabboCommunicationManager;
    import com.sulake.iid.IIDSessionDataManager;
    import com.sulake.iid.IIDHabboNavigator;
    import com.sulake.iid.IIDHabboSoundManager;
    import com.sulake.iid.IIDHabboTracking;
    import com.sulake.iid.IIDHabboLocalizationManager;
    import com.sulake.habbo.localization.IHabboLocalizationManager;
    import com.sulake.iid.IIDHabboFriendBar;
    import __AS3__.vec.Vector;
    import com.sulake.habbo.configuration.enum.HabboComponentFlags;
    import com.sulake.core.communication.connection.IConnection;
    import com.sulake.habbo.session.SecurityLevelEnum;
    import com.sulake.core.assets.IAsset;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.core.window.IWindow;
    import com.sulake.habbo.utils.HabboWebTools;
    import com.sulake.habbo.communication.messages.incoming.callforhelp.CallForHelpCategoryData;
	import flash.display.BitmapData;

    public class ModerationManager extends Component implements IHabboModeration 
    {
        private var _windowManager:IHabboWindowManager;
        private var _communicationManager:IHabboCommunicationManager;
        private var _sessionDataManager:ISessionDataManager;
        private var _navigator:IHabboNavigator;
        private var _soundManager:IHabboSoundManager;
        private var _tracking:IHabboTracking;
        private var _friendBar:IHabboFriendBar;
		private var _toolBar:IHabboToolbar;
		private var _avatarRenderManager:IAvatarRenderManager;
        private var _moderationMessageHandler:ModerationMessageHandler;
        private var _issueManager:IssueManager;
        private var _startPanelCtrl:StartPanelCtrl;
        private var _windowTracker:WindowTracker;
        private var _initMsg:ModeratorInitData;
        private var _currentFlatId:int;
		private var _moderationIconWidget:ModerationIconWidget;

        public function ModerationManager(k:IContext, _arg_2:uint=0, _arg_3:IAssetLibrary=null)
        {
            super(k, _arg_2, _arg_3);
            this._startPanelCtrl = new StartPanelCtrl(this);
            this._windowTracker = new WindowTracker();
			this._moderationIconWidget = new ModerationIconWidget(this);
        }

        override protected function get dependencies():Vector.<ComponentDependency>
        {
            return (super.dependencies.concat(new <ComponentDependency>[new ComponentDependency(new IIDHabboWindowManager(), function (k:IHabboWindowManager):void
            {
                _windowManager = k;
            }), new ComponentDependency(new IIDHabboCommunicationManager(), function (k:IHabboCommunicationManager):void
            {
                _communicationManager = k;
            }), new ComponentDependency(new IIDSessionDataManager(), function (k:ISessionDataManager):void
            {
                _sessionDataManager = k;
            }), new ComponentDependency(new IIDHabboNavigator(), function (k:IHabboNavigator):void
            {
                _navigator = k;
            }), new ComponentDependency(new IIDHabboSoundManager(), function (k:IHabboSoundManager):void
            {
                _soundManager = k;
            }), new ComponentDependency(new IIDHabboTracking(), function (k:IHabboTracking):void
            {
                _tracking = k;
            }), new ComponentDependency(new IIDHabboLocalizationManager(), function (k:IHabboLocalizationManager):void
            {
                IssueCategoryNames._Str_25690(k);
            }), new ComponentDependency(new IIDHabboFriendBar(), function (k:IHabboFriendBar):void
            {
                _friendBar = k;
            }), new ComponentDependency(new IIDHabboToolbar(), function (k:IHabboToolbar):void
            {
                _toolBar = k;
            }, false, 
			[{
                "type":HabboToolbarEvent.ICON_MODTOOL,
                "callback":this.onModToolIconClicked
            }]), new ComponentDependency(new IIDAvatarRenderManager(), function (k:IAvatarRenderManager):void
			{
				_avatarRenderManager = k;
			})]));
        }

		private function onModToolIconClicked(k:HabboToolbarEvent):void
        {
			this.setVisible(true);
        }
		
        override protected function initComponent():void
        {
            if (HabboComponentFlags.isRoomViewerMode(flags))
            {
                return;
            }
            this._moderationMessageHandler = new ModerationMessageHandler(this);
            this._issueManager = new IssueManager(this);
        }

        override public function dispose():void
        {
            if (disposed)
            {
                return;
            }
            if (this._startPanelCtrl != null)
            {
                this._startPanelCtrl.dispose();
                this._startPanelCtrl = null;
            }
            super.dispose();
        }

        public function userSelected(k:int, _arg_2:String, figure:String=null, gender:String=null):void
        {
            Logger.log(((("USER SELECTED: " + k) + ", ") + _arg_2));
            this._startPanelCtrl.userSelected(k, _arg_2, figure, gender);
        }
		
		public function setVisible(visible:Boolean):void
		{
			this._startPanelCtrl.setVisible(visible);
		}

        public function get windowManager():IHabboWindowManager
        {
            return this._windowManager;
        }

        public function get sessionDataManager():ISessionDataManager
        {
            return this._sessionDataManager;
        }
		
		public function get avatarRenderManager():IAvatarRenderManager
		{
			return this._avatarRenderManager;
		}

        public function get issueManager():IssueManager
        {
            return this._issueManager;
        }

        public function get connection():IConnection
        {
            return this._communicationManager.connection;
        }

        public function get startPanel():StartPanelCtrl
        {
            return this._startPanelCtrl;
        }

        public function get initMsg():ModeratorInitData
        {
            return this._initMsg;
        }

        public function get moderationMessageHandler():ModerationMessageHandler
        {
            return this._moderationMessageHandler;
        }

        public function get windowTracker():WindowTracker
        {
            return this._windowTracker;
        }

        public function get currentFlatId():int
        {
            return this._currentFlatId;
        }

        public function get soundManager():IHabboSoundManager
        {
            return this._soundManager;
        }

        public function set initMsg(k:ModeratorInitData):void
        {
            this._initMsg = k;
        }

        public function set currentFlatId(k:int):void
        {
            this._currentFlatId = k;
        }

        public function get isModerator():Boolean
        {
            return this._sessionDataManager.hasSecurity(SecurityLevelEnum.MODERATOR);
        }

        public function getXmlWindow(k:String, _arg_2:String="_xml", _arg_3:int=1):IWindow
        {
            var _local_5:IAsset;
            var _local_6:XmlAsset;
            var _local_4:IWindow;
            try
            {
                _local_5 = assets.getAssetByName((k + _arg_2));
                _local_6 = XmlAsset(_local_5);
                _local_4 = this._windowManager.buildFromXML(XML(_local_6.content), _arg_3);
            }
            catch(e:Error)
            {
            }
            return _local_4;
        }

        public function openHkPage(k:String, _arg_2:String):void
        {
            var _local_3:String = getProperty(k);
            var _local_4:String = (_local_3 + _arg_2);
            var _local_5:String = "housekeeping";
            HabboWebTools.navigateToURL(_local_4, _local_5);
        }

        public function goToRoom(k:int):void
        {
            Logger.log(("MOD: GO TO ROOM: " + k));
            this._navigator.goToPrivateRoom(k);
        }

        public function openThread(k:int, _arg_2:int):void
        {
            context.createLinkEvent(((("groupforum/" + k) + "/") + _arg_2));
            Logger.log(((("MOD: OPEN THREAD: " + k) + ", ") + _arg_2));
        }

        public function openThreadMessage(k:int, _arg_2:int, _arg_3:int):void
        {
            context.createLinkEvent(((((("groupforum/" + k) + "/") + _arg_2) + "/") + _arg_3));
            Logger.log(((((("MOD: OPEN THREAD MESSAGE: " + k) + ", ") + _arg_2) + ", ") + _arg_3));
        }

        internal function logEvent(k:String, _arg_2:String):void
        {
            if (this._tracking != null)
            {
                this._tracking.trackEventLog("Moderation", _arg_2, k);
            }
        }

        internal function trackGoogle(k:String, _arg_2:int=-1):void
        {
            if (this._tracking != null)
            {
                this._tracking.trackGoogle("moderationManager", k, _arg_2);
            }
        }

        public function set cfhTopics(k:Vector.<CallForHelpCategoryData>):void
        {
            this._issueManager.setCfhTopics(k);
        }
		
		public function get moderationIcon():ModerationIconWidget
		{
			return this._moderationIconWidget;
		}
    }
}
