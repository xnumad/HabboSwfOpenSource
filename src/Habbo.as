package 
{
    import flash.display.MovieClip;
    import com.sulake.habbo.utils.HabboWebTools;
    import flash.events.Event;
    import flash.external.ExternalInterface;
    import flash.net.URLRequest;
    import flash.net.URLVariables;
    import flash.system.Capabilities;
    import flash.system.System;
    import com.sulake.core.utils.ErrorReportStorage;
    import flash.net.URLRequestMethod;
    import flash.net.navigateToURL;
    import flash.net.sendToURL;
    import flash.display.StageScaleMode;
    import flash.display.StageQuality;
    import flash.display.StageAlign;
    import flash.events.ProgressEvent;
    import flash.events.HTTPStatusEvent;
    import flash.events.IOErrorEvent;
    import flash.events.UncaughtErrorEvent;
    import com.sulake.core.utils.MouseWheelEnabler;
    import flash.utils.setTimeout;
    import flash.display.DisplayObject;
    import flash.utils.getDefinitionByName;
    import flash.system.Security;
	

    public class Habbo extends MovieClip 
    {
        public static const CORE_RATIO:Number = 0.6;
        private static const APPROXIMATE_SWF_SIZE:int = 11000000;
        protected static var PROCESSLOG_ENABLED:Boolean = false;
        public static const ERROR_VARIABLE_IS_FATAL:String = "is_fatal";
        public static const ERROR_VARIABLE_CLIENT_CRASH_TIME:String = "crash_time";
        public static const ERROR_VARIABLE_CONTEXT:String = "error_ctx";
        public static const ERROR_VARIABLE_FLASH_VERSION:String = "flash_version";
        public static const ERROR_VARIABLE_AVERAGE_UPDATE_INTERVAL:String = "avg_update";
        public static const ERROR_VARIABLE_DEBUG:String = "debug";
        public static const ERROR_VARIABLE_DESCRIPTION:String = "error_desc";
        public static const ERROR_VARIABLE_CATEGORY:String = "error_cat";
        public static const ERROR_VARIABLE_DATA:String = "error_data";
        private static const CLIENT_STARTING:String = "client.starting";
        private static const CLIENT_STARTING_LOADING:String = "client.starting.revolving";
        private static const PROCESSLOG_ENABLED_KEY:String = "processlog.enabled";
        private static const NEW_USER_FLOW_ENABLED:String = "new.user.flow.enabled";
        private static const NEW_USER_ONBOARDING_HC_FLOW_ENABLED:String = "new.user.onboarding.hc.flow.enabled";
        private static const NEW_USER_ONBOARDING_SHOW_HC_ITEMS:String = "new.user.onboarding.show.hc.items";
        private static const NEW_USER_ONBOARDING_PAGE_TO_SHOW:String = "new.user.flow.page";
        private static const RECEPTION_LOG_STEP_FUNCTION:String = "NewUserReception.logStep";
        private static const STEP_NUX_ENTERED:String = "NUX_ENTERED";
        private static const STEP_RECEPTION_EXITED:String = "RECEPTION_EXITED";
        private static const STEP_NUX_EXITED:String = "NUX_EXITED";
        private static const STEP_CLIENT_LOADED:String = "CLIENT_LOADED";
        public static const ERROR_CATEGORY_FINALIZE_PRELOADING:int = 9;
        public static const ERROR_CATEGORY_DOWNLOAD_FONT:int = 11;
        public static const ERROR_UNCAUGHT_ERROR:int = 40;
        public static var CONNECTION_HOST:String;
        public static var CONNECTION_PORTS:String;
        private static var _crashURL:String = "";
        private static var _crashed:Boolean = false;
        private static var _isSpaWeb:Boolean = false;

        private var _cacheIsDirty:Boolean;
        private var _cachedBytesTotal:uint;
        private var _cachedBytesLoaded:uint;
        private var _httpStatus:int;
        private var _disposed:Boolean = false;
        private var _loaderCompleted:Boolean;
        private var _loadingScreen:IHabboLoadingScreen;
        private var _onBoardingHc:OnBoardingHcFlow = null;
        private var _gzipEnvironmentReported:Boolean = false;

        public function Habbo()
        {
			super();
            var _local_2:String;
            stop();
            _isSpaWeb = (stage.loaderInfo.parameters["spaweb"] == "1");
            HabboWebTools.isSpaWeb = _isSpaWeb;
            CONNECTION_HOST = root.loaderInfo.parameters["connection.info.host"];
            CONNECTION_PORTS = root.loaderInfo.parameters["connection.info.port"];
            var k:String = root.loaderInfo.parameters["client.fatal.error.url"];
			
			if (k != null)
			{
				Habbo._crashURL = k;
			}
			else
			{
				_local_2 = root.loaderInfo.parameters["url.prefix"];
				if (_local_2 != null)
				{
					Habbo._crashURL = (_local_2 + "/flash_client_error");
				};
			};
			if (stage)
			{
				this.onAddedToStage();
			}
			else
			{
				this.addEventListener(Event.ADDED_TO_STAGE, this.onAddedToStage);
			};
			
        }

        public static function trackLoginStep(k:String, _arg_2:String=null):void
        {
			if (k == null || k.length < 15)
			{
				return;
			}
			
            if (Habbo.PROCESSLOG_ENABLED)
            {
                try
                {
                    if (ExternalInterface.available)
                    {
                        if (_arg_2 != null)
                        {
                            ExternalInterface.call("FlashExternalInterface.logLoginStep", k, _arg_2);
                        }
                        else
                        {
                            ExternalInterface.call("FlashExternalInterface.logLoginStep", k);
                        }
                    }
                    else
                    {
                        //_Str_632.log("ExternalInterface is not available, tracking is disabled");
                    }
                }
                catch(e:Error)
                {
                }
            }
        }

        public static function reportCrash(errorMessage:String, crashCategory:int, critical:Boolean, error:Error=null):void
        {
            var request:URLRequest = new URLRequest(Habbo._crashURL);
            var variables:URLVariables = new URLVariables();
            variables[ERROR_VARIABLE_CLIENT_CRASH_TIME] = new Date().getTime().toString();
            variables[ERROR_VARIABLE_IS_FATAL] = critical.toString();
            variables[ERROR_VARIABLE_CONTEXT] = "";
            variables[ERROR_VARIABLE_FLASH_VERSION] = Capabilities.version;
            variables[ERROR_VARIABLE_AVERAGE_UPDATE_INTERVAL] = 0;
            variables[ERROR_VARIABLE_DESCRIPTION] = errorMessage;
            variables[ERROR_VARIABLE_CATEGORY] = String(crashCategory);
            if (error != null)
            {
                variables[ERROR_VARIABLE_DATA] = String(error.getStackTrace());
            }
            variables[ERROR_VARIABLE_DEBUG] = (("Memory usage: " + Math.round((System.totalMemory / (0x0400 * 0x0400)))) + " MB");
            var keys:Array = ErrorReportStorage.getParameterNames();
            var length:int = keys.length;
            var i:int;
            while (i < length)
            {
                variables[keys[i]] = ErrorReportStorage.getParameter(keys[i]);
                i = (i + 1);
            }
            variables[ERROR_VARIABLE_DEBUG] = ErrorReportStorage.getDebugData();
            request.data = variables;
            request.method = URLRequestMethod.POST;
            if (critical)
            {
                if (!Habbo._crashed)
                {
                    Habbo._crashed = true;
                    if (_isSpaWeb)
                    {
                        logSpaWeb("FlashExternalInterface.logCrash", variables);
                    }
                    else
                    {
                        navigateToURL(request, "_self");
                    }
                }
            }
            else
            {
                try
                {
                    if (_isSpaWeb)
                    {
                        logSpaWeb("FlashExternalInterface.logError", variables);
                    }
                    else
                    {
                        sendToURL(request);
                    }
                }
                catch(e:Error)
                {
                    Logger.log(("Error while sending error report: " + e.message));
                }
            }
        }

        private static function logSpaWeb(k:String, _arg_2:URLVariables):void
        {
            try
            {
                if (ExternalInterface.available)
                {
                    ExternalInterface.call(k, _arg_2.toString());
                }
            }
            catch(e:Error)
            {
            }
        }


        private function onAddedToStage(e:Event=null):void
        {
            removeEventListener(Event.ADDED_TO_STAGE, this.onAddedToStage);
            this.enableAccessFromJavascript();
            Habbo.PROCESSLOG_ENABLED = (stage.loaderInfo.parameters["processlog.enabled"] == "1");
            trackLoginStep(ClientEnum.CLIENT_INIT_START);
            stage.scaleMode = StageScaleMode.NO_SCALE;
            stage.quality = StageQuality.LOW;
            stage.align = StageAlign.TOP_LEFT;
            root.loaderInfo.addEventListener(ProgressEvent.PROGRESS, this.onPreLoadingProgress);
            root.loaderInfo.addEventListener(HTTPStatusEvent.HTTP_STATUS, this.onPreLoadingStatus);
            root.loaderInfo.addEventListener(Event.COMPLETE, this.onPreLoadingCompleted);
            root.loaderInfo.addEventListener(IOErrorEvent.IO_ERROR, this.onPreLoadingFailed);
            root.loaderInfo.uncaughtErrorEvents.addEventListener(UncaughtErrorEvent.UNCAUGHT_ERROR, function (k:UncaughtErrorEvent):void
            {
				//trackLoginStep(((("Uncaught client error, eventType: " + k.type) + " errorID: ") + k.errorID) + " | " + k.toString());
                reportCrash(((("Uncaught client error, eventType: " + k.type) + " errorID: ") + k.errorID), ERROR_UNCAUGHT_ERROR, true, k.error);
            });
            this.createNewUserLobbyOrLoadingScreen();
            this.checkPreLoadingStatus();
            MouseWheelEnabler.init(stage);
        }

        private function onPreLoadingStatus(k:HTTPStatusEvent):void
        {
            this._httpStatus = k.status;
        }

        private function onPreLoadingProgress(k:Event):void
        {
            this.checkPreLoadingStatus();
            this.updateLoadingBarProgress();
            this._cacheIsDirty = true;
        }

        private function onPreLoadingCompleted(event:Event):void
        {
            try
            {
                this._loaderCompleted = true;
                this.checkPreLoadingStatus();
            }
            catch(error:Error)
            {
				trackLoginStep(error.getStackTrace());
                trackLoginStep(ClientEnum.CLIENT_INIT_SWF_ERROR);
				trackLoginStep("Failed to finalize main swf preloading: " + error.message);
                reportCrash(("Failed to finalize main swf preloading: " + error.message), ERROR_CATEGORY_FINALIZE_PRELOADING, true, error);
            }
        }

        private function onPreLoadingFailed(event:IOErrorEvent):void
        {
            setTimeout(function ():void
            {
				trackLoginStep(event.toString());
                trackLoginStep(ClientEnum.CLIENT_INIT_SWF_ERROR);
				trackLoginStep(((((("IO error in main swf preloading: " + event.text) + " / URL: ") + root.loaderInfo.loaderURL) + " / HTTP status: ") + _httpStatus));
                reportCrash(((((("IO error in main swf preloading: " + event.text) + " / URL: ") + root.loaderInfo.loaderURL) + " / HTTP status: ") + _httpStatus), ERROR_CATEGORY_FINALIZE_PRELOADING, true, null);
            }, 50000);
        }

        private function checkPreLoadingStatus():void
        {
            if (this._onBoardingHc != null)
            {
                return;
            }
            if (((this._loaderCompleted) && (this.progress >= 1)))
            {
                if (((!(this.newUserOnboardingEnabled)) || ((this.newUserOnboardingEnabled) && (this._onBoardingHc == null))))
                {
                    this.finalizePreloading();
                    return;
                }
            }
        }

        private function calculateProgress():void
        {
            this._cachedBytesLoaded = root.loaderInfo.bytesLoaded;
            if (root.loaderInfo.bytesTotal == 0)
            {
                if (!this._gzipEnvironmentReported)
                {
                    this._cachedBytesTotal = uint(APPROXIMATE_SWF_SIZE);
                    this._gzipEnvironmentReported = true;
                    trackLoginStep(ClientEnum.CLIENT_GZIP_ENVIRONMENT);
                }
            }
            if (root.loaderInfo.bytesTotal != 0)
            {
                this._cachedBytesTotal = root.loaderInfo.bytesTotal;
            }
            if (((this._cachedBytesTotal < this._cachedBytesLoaded) || (this._loaderCompleted)))
            {
                this._cachedBytesTotal = this._cachedBytesLoaded;
            }
            this._cacheIsDirty = false;
            if (((!(this._loaderCompleted)) && (this._cachedBytesLoaded == this._cachedBytesTotal)))
            {
                this._cacheIsDirty = true;
                this._cachedBytesLoaded = int((this._cachedBytesLoaded * 0.99));
            }
        }

        private function createNewUserLobbyOrLoadingScreen():void
        {
            if (this.newUserReceptionEnabled)
            {
                if (this.newUserOnboardingEnabled)
                {
                    this._onBoardingHc = new OnBoardingHcFlow();
                    this._onBoardingHc.addEventListener(OnBoardingHcFlow.NEWUSERFLOWFINISHED, this.onNewUserReceptionFinished);
                    stage.addChild(this._onBoardingHc);
                    this._onBoardingHc.setHcVisibility(this.showHcItemDuringOnboarding);
                    this._onBoardingHc.init(this.onboardingGoToPage);
                    this.updateLoadingBarProgress();
                    this.trackNewReceptionStep(STEP_NUX_ENTERED);
                }
                return;
            }
            this.createLoadingScreen();
        }

        public function createLoadingScreen():void
        {
            var k:String = stage.loaderInfo.parameters[CLIENT_STARTING];
            if (k == null)
            {
                k = CLIENT_STARTING;
            }
            var _local_2:String = stage.loaderInfo.parameters[CLIENT_STARTING_LOADING];
            if (_local_2 == CLIENT_STARTING_LOADING)
            {
                _local_2 = null;
            }
            this._loadingScreen = new HabboLoadingScreen(stage.stageWidth, stage.stageHeight, k, _local_2);
            this.updateLoadingBarProgress();
            stage.addChild(DisplayObject(this._loadingScreen));
        }

        private function updateLoadingBarProgress():void
        {
            var k:Number;
            var _local_2:Number;
            if (this._loadingScreen != null)
            {
                _local_2 = this.progress;
                if (_local_2 == 0)
                {
                    k = ((this.bytesLoaded / APPROXIMATE_SWF_SIZE) * CORE_RATIO);
                }
                else
                {
                    k = (_local_2 * CORE_RATIO);
                }
                this._loadingScreen._Str_774(k);
            }
        }

        private function finalizePreloading():void
        {
            var _local_2:DisplayObject;
            this.trackNewReceptionStep(STEP_CLIENT_LOADED);
            trackLoginStep(ClientEnum.CLIENT_INIT_SWF_LOADED);
            root.loaderInfo.removeEventListener(ProgressEvent.PROGRESS, this.onPreLoadingProgress);
            root.loaderInfo.removeEventListener(HTTPStatusEvent.HTTP_STATUS, this.onPreLoadingStatus);
            root.loaderInfo.removeEventListener(Event.COMPLETE, this.onPreLoadingCompleted);
            root.loaderInfo.removeEventListener(IOErrorEvent.IO_ERROR, this.onPreLoadingFailed);
            nextFrame();

            HabboMain;
			
            var componentClass:Class = (getDefinitionByName("HabboMain") as Class);

            if (componentClass)
            {
                _local_2 = (new componentClass(this._loadingScreen) as DisplayObject);
                if (_local_2)
                {
                    _local_2.addEventListener(Event.REMOVED, this.onMainRemoved, false, 0, true);
                    addChild(_local_2);
                }
            }
        }

        private function enableAccessFromJavascript():void
        {
            var k:String;
            var _local_2:int;
            if (ExternalInterface.available)
            {
                k = stage.loaderInfo.parameters["url.prefix"];
                if (k != null)
                {
                    k = k.replace("http://", "").replace("https://", "");
                    _local_2 = k.indexOf(":");
                    if (_local_2 != -1)
                    {
                        k = k.substring(0, _local_2);
                    }
                    if (this._Str_1228(k))
                    {
                        Security.allowDomain(k);
                    }
                }
            }
        }

        private function onMainRemoved(k:Event):void
        {
            this.dispose();
        }

        private function dispose():void
        {
            removeEventListener(Event.ADDED_TO_STAGE, this.onAddedToStage);
            if (!this._disposed)
            {
                this._disposed = true;
                if (this._loadingScreen != null)
                {
                    this._loadingScreen = null;
                }
                if (parent)
                {
                    parent.removeChild(this);
                }
            }
        }

        public function get progress():Number
        {
            return (this.bytesTotal != 0) ? (this.bytesLoaded / this.bytesTotal) : ((this._loaderCompleted) ? 1 : 0);
        }

        public function get bytesLoaded():uint
        {
            if (this._cacheIsDirty)
            {
                this.calculateProgress();
            }
            return this._cachedBytesLoaded;
        }

        public function get bytesTotal():uint
        {
            if (this._cacheIsDirty)
            {
                this.calculateProgress();
            }
            return this._cachedBytesTotal;
        }

        private function get newUserReceptionEnabled():Boolean
        {
            return stage.loaderInfo.parameters[NEW_USER_FLOW_ENABLED] == "true";
        }

        private function get newUserOnboardingEnabled():Boolean
        {
            return stage.loaderInfo.parameters[NEW_USER_ONBOARDING_HC_FLOW_ENABLED] == "true";
        }

        private function get showHcItemDuringOnboarding():Boolean
        {
            return stage.loaderInfo.parameters[NEW_USER_ONBOARDING_SHOW_HC_ITEMS] == "true";
        }

        private function get onboardingGoToPage():String
        {
            return stage.loaderInfo.parameters[NEW_USER_ONBOARDING_PAGE_TO_SHOW];
        }

        private function get processLogEnabled():Boolean
        {
            return stage.loaderInfo.parameters[PROCESSLOG_ENABLED_KEY] == "1";
        }

        public function get infoHost():String
        {
            return stage.loaderInfo.parameters["connection.info.host"];
        }

        public function get infoPort():String
        {
            return stage.loaderInfo.parameters["connection.info.port"];
        }

        private function _Str_1228(_arg_1:String, _arg_2:Object=null):Boolean
        {
            return _arg_1 == "localhost"
        }

        private function onNewUserReceptionFinished(k:Event):void
        {
            if (this.newUserReceptionEnabled)
            {
                if (this.newUserOnboardingEnabled)
                {
                    this._onBoardingHc.removeEventListener(OnBoardingHcFlow.NEWUSERFLOWFINISHED, this.onNewUserReceptionFinished);
                    this._onBoardingHc.dispose();
                    this._onBoardingHc = null;
                    this._loadingScreen = null;
                    this.trackNewReceptionStep(STEP_NUX_EXITED);
                }
            }
            this.createLoadingScreen();
            this.checkPreLoadingStatus();
        }

        private function trackNewReceptionStep(k:String):void
        {
            if (((ExternalInterface.available) && (this.newUserReceptionEnabled)))
            {
                try
                {
                    if (ExternalInterface.available)
                    {
                        ExternalInterface.call(RECEPTION_LOG_STEP_FUNCTION, k);
                    }
                }
                catch(e:Error)
                {
                }
            }
        }
    }
}