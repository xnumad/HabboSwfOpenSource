package 
{
    import flash.display.Sprite;
    import com.sulake.core.runtime.ICore;
    import flash.events.Event;
    import flash.utils.getQualifiedClassName;
    import com.sulake.core.Core;
    import flash.events.ProgressEvent;
    import com.sulake.core.runtime.Component;
    import com.sulake.core.utils.ErrorReportStorage;
    import flash.system.Capabilities;
    import com.sulake.core.runtime.ICoreErrorLogger;
    import flash.external.ExternalInterface;
    import com.sulake.core.runtime.IID;
    import com.sulake.iid.IIDHabboLocalizationManager;
    import com.sulake.iid.IIDHabboConfigurationManager;
    import com.sulake.iid.IIDRoomEngine;
    import com.sulake.habbo.room.events.RoomEngineEvent;
    import flash.utils.setInterval;
    import com.sulake.habbo.utils.HabboWebTools;

    public class HabboMain extends Sprite 
    {
        public static const CORE_RATIO:Number = Habbo.CORE_RATIO;//0.6
        private static const INIT_STEPS:int = 3;

        private var _core:ICore;
        private var _loadingScreen:IHabboLoadingScreen;
        private var _totalSteps:int = 3;
        private var _loadedFiles:int = 0;
        private var _completedInitSteps:int = 0;
        private var roomEngineReady:Boolean = false;
        private var coreRunning:Boolean = false;

        public function HabboMain(k:IHabboLoadingScreen)
        {
            this._loadingScreen = k;
            addEventListener(Event.ADDED_TO_STAGE, this.onAddedToStage);
            addEventListener(Event.EXIT_FRAME, this.onExitFrame);
            Logger.log(((getQualifiedClassName(Core) + " version: ") + Core.version));
        }

        private function dispose():void
        {
            removeEventListener(ProgressEvent.PROGRESS, this.onProgressEvent);
            removeEventListener(Event.COMPLETE, this.onCompleteEvent);
            removeEventListener(Event.ADDED_TO_STAGE, this.onAddedToStage);
            removeEventListener(Event.EXIT_FRAME, this.onExitFrame);
            if (this._loadingScreen)
            {
                this._loadingScreen.dispose();
                this._loadingScreen = null;
            }
            if (this._core != null)
            {
                this._core.events.removeEventListener(Component.COMPONENT_EVENT_RUNNING, this.onCoreRunning);
            }
            if (parent)
            {
                parent.removeChild(this);
            }
        }

        public function unloading():void
        {
            try
            {
                if (((this._core) && (!(this._core.disposed))))
                {
                    ErrorReportStorage.addDebugData("Unload", "Client unloading started");
                    this._core.events.dispatchEvent(new Event(Event.UNLOAD));
                }
            }
            catch(error:Error)
            {
            }
        }

        protected function onAddedToStage(event:Event=null):void
        {
            try
            {
                this.prepareCore();
            }
            catch(error:Error)
            {
                Habbo.trackLoginStep(ClientEnum.CLIENT_INIT_CORE_FAIL);
				Habbo.trackLoginStep(error.message);
                Habbo.reportCrash(("Failed to prepare the core: " + error.message), Core.ERROR_CATEGORY_INITIALIZE_CORE, true, error);
                Core.dispose();
            }
        }

        protected function onExitFrame(k:Event=null):void
        {
            if (this.roomEngineReady && this.coreRunning)
            {
                this.dispose();
            }
        }

        private function prepareCore():void
        {
			try
			{
            var k:ICoreErrorLogger = ((Capabilities.playerType != "StandAlone") ? new HabboCoreErrorReporter() : null);
            this._core = Core.instantiate(stage, Core.CORE_SETUP_FRAME_UPDATE_COMPLEX, k);
            this._core.prepareComponent(HabboTrackingLib);
            addEventListener(ProgressEvent.PROGRESS, this.onProgressEvent);
            addEventListener(Event.COMPLETE, this.onCompleteEvent);
            var _local_2:XML = <config>
				<asset-libraries>
					<library url="hh_human_body.swf"/>
					<library url="hh_human_item.swf"/>
				</asset-libraries>
				<service-libraries/>
				<component-libraries/>
			</config>
            ;
            this._core.readConfigDocument(_local_2, this);
            this._totalSteps = ((this._core.getNumberOfFilesPending() + this._core.getNumberOfFilesLoaded()) + INIT_STEPS);
            this._core.prepareComponent(CoreCommunicationFrameworkLib);
            this._core.prepareComponent(HabboRoomObjectLogicLib);
            this._core.prepareComponent(HabboRoomObjectVisualizationLib);
            this._core.prepareComponent(RoomManagerLib);
            this._core.prepareComponent(RoomSpriteRendererLib);
            this._core.prepareComponent(HabboRoomSessionManagerLib);
            this._core.prepareComponent(HabboAvatarRenderLib);
            this._core.prepareComponent(HabboSessionDataManagerLib);
            this._core.prepareComponent(HabboConfigurationCom);
            this._core.prepareComponent(HabboLocalizationCom);
            this._core.prepareComponent(HabboWindowManagerCom);
            this._core.prepareComponent(HabboCommunicationCom);
            this._core.prepareComponent(HabboCommunicationDemoCom);
            this._core.prepareComponent(HabboNavigatorCom);
            this._core.prepareComponent(HabboFriendListCom);
            this._core.prepareComponent(HabboMessengerCom);
            this._core.prepareComponent(HabboInventoryCom);
            this._core.prepareComponent(HabboToolbarCom);
            this._core.prepareComponent(HabboCatalogCom);
            this._core.prepareComponent(HabboRoomEngineCom);
            this._core.prepareComponent(HabboRoomUICom);
            this._core.prepareComponent(HabboAvatarEditorCom);
            this._core.prepareComponent(HabboNotificationsCom);
            this._core.prepareComponent(HabboHelpCom);
            this._core.prepareComponent(HabboAdManagerCom);
            this._core.prepareComponent(HabboModerationCom);
            this._core.prepareComponent(HabboUserDefinedRoomEventsCom);
            this._core.prepareComponent(HabboSoundManagerFlash10Com);
            this._core.prepareComponent(HabboQuestEngineCom);
            this._core.prepareComponent(HabboFriendBarCom);
            this._core.prepareComponent(HabboGroupsCom);
            this._core.prepareComponent(HabboGamesCom);
            this._core.prepareComponent(HabboFreeFlowChatCom);
            this._core.prepareComponent(HabboNewNavigatorCom);
            this.addInitializationProgressListeners();
			Habbo.trackLoginStep("addInitializationProgressListeners");
			}
			catch (error: Error)
			{
				Habbo.trackLoginStep("Error in HabboMain (" + error.message + "): " + error.getStackTrace());
			}
        }

        private function updateProgressBar():void
        {
            var k:Number;
            if (this._loadingScreen != null)
            {
                k = (CORE_RATIO + (((this._completedInitSteps + this._loadedFiles) / this._totalSteps) * (1 - CORE_RATIO)));
                this._loadingScreen._Str_774(k);
            }
        }

        private function onProgressEvent(k:ProgressEvent):void
        {
            this._loadedFiles = this._core.getNumberOfFilesLoaded();
            this.updateProgressBar();
        }

        private function onCompleteEvent(k:Event):void
        {
            removeEventListener(ProgressEvent.PROGRESS, this.onProgressEvent);
            removeEventListener(Event.COMPLETE, this.onCompleteEvent);
            this.initializeCore();
        }

        private function initializeCore():void
        {
			Habbo.trackLoginStep("Initializing Core!");
            try
            {
                this._core.initialize();
                if (ExternalInterface.available)
                {
                    ExternalInterface.addCallback("unloading", this.unloading);
                }
            }
            catch(error:Error)
            {
				Habbo.trackLoginStep(error.getStackTrace());
                Habbo.trackLoginStep(ClientEnum.CLIENT_INIT_CORE_FAIL);
                Core.crash(("Failed to initialize the core: " + error.message), Core.ERROR_CATEGORY_INITIALIZE_CORE, error);
            }
        }

        private function simpleQueueInterface(k:IID, _arg_2:Function):void
        {
            var _local_3:Object = this._core.queueInterface(k, _arg_2);
            if (_local_3 != null)
            {
                (_arg_2(k, _local_3));
            }
        }

        private function addInitializationProgressListeners():void
        {
            this.simpleQueueInterface(new IIDHabboLocalizationManager(), function (k:IID, _arg_2:Component):void
            {
                _arg_2.events.addEventListener(Event.COMPLETE, onLocalizationComplete);
            });
            this.simpleQueueInterface(new IIDHabboConfigurationManager(), this.onConfigurationComplete);
            this.simpleQueueInterface(new IIDRoomEngine(), function (k:IID, _arg_2:Component):void
            {
                _arg_2.events.addEventListener(RoomEngineEvent.ENGINE_INITIALIZED, onRoomEngineReady);
            });
            this._core.events.addEventListener(Component.COMPONENT_EVENT_RUNNING, this.onCoreRunning);
        }

        private function onLocalizationComplete(k:Event):void
        {
            Habbo.trackLoginStep(ClientEnum.CLIENT_INIT_LOCALIZATION_LOADED);
            this._completedInitSteps++;
            this.updateProgressBar();
        }

        private function onConfigurationComplete(k:IID, _arg_2:Component):void
        {
            Habbo.trackLoginStep(ClientEnum.CLIENT_INIT_CONFIG_LOADED);
            this._completedInitSteps++;
            this.updateProgressBar();
        }

        private function onRoomEngineReady(k:Event):void
        {
            this.roomEngineReady = true;
            Habbo.trackLoginStep(ClientEnum.CLIENT_INIT_ROOM_READY);
            if (this._core.getInteger("spaweb", 0) == 1)
            {
                this.startSendingHeartBeat();
            }
        }

        private function startSendingHeartBeat():void
        {
            this.sendHeartBeat();
            setInterval(this.sendHeartBeat, 10000);
        }

        private function sendHeartBeat():void
        {
            HabboWebTools.sendHeartBeat();
        }

        private function onCoreRunning(k:Event):void
        {
            this.coreRunning = true;
            Habbo.trackLoginStep(ClientEnum.CLIENT_INIT_CORE_RUNNING);
            this._completedInitSteps++;
            this.updateProgressBar();
        }
    }
}
import com.sulake.core.runtime.ICoreErrorLogger;

class HabboCoreErrorReporter implements ICoreErrorLogger 
{


    public function logError(k:String, _arg_2:Boolean, _arg_3:int=-1, _arg_4:Error=null):void
    {
        Habbo.reportCrash(k, _arg_3, _arg_2, _arg_4);
    }


}
