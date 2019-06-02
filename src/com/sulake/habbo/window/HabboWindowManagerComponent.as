package com.sulake.habbo.window
{
    import com.sulake.core.runtime.Component;
    import com.sulake.core.window.ICoreWindowManager;
    import com.sulake.core.window.IWindowFactory;
    import com.sulake.core.runtime.IUpdateReceiver;
    import com.sulake.core.window.IInputEventTracker;
    import com.sulake.core.window.IWidgetFactory;
    import flash.events.Event;
    import com.sulake.habbo.window.enum._Str_5209;
    import com.sulake.habbo.localization.IHabboLocalizationManager;
    import com.sulake.core.window.IWindowContext;
    import com.sulake.core.window.graphics.IWindowRenderer;
    import com.sulake.core.window.graphics.SkinContainer;
    import com.sulake.core.window.tools.ProfilerOutput;
    import com.sulake.core.utils.profiler.ProfilerAgentTask;
    import com.sulake.habbo.window.theme.ThemeManager;
    import com.sulake.habbo.avatar.IAvatarRenderManager;
    import com.sulake.habbo.communication.IHabboCommunicationManager;
    import com.sulake.habbo.session.ISessionDataManager;
    import com.sulake.habbo.room.IRoomEngine;
    import com.sulake.habbo.window.utils.floorplaneditor.BCFloorPlanEditor;
    import com.sulake.habbo.window.utils.habbopedia._Str_7787;
    import com.sulake.habbo.window.handlers.HabbletLinkHandler;
    import com.sulake.habbo.window.utils._Str_9474;
    import com.sulake.core.utils.FontEnum;
    import com.sulake.core.window.components.HTMLTextController;
    import com.sulake.core.runtime.IContext;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.core.runtime.ComponentDependency;
    import com.sulake.iid.IIDSessionDataManager;
    import com.sulake.iid.IIDHabboLocalizationManager;
    import com.sulake.iid.IIDHabboConfigurationManager;
    import com.sulake.core.runtime.IHabboConfigurationManager;
    import com.sulake.iid.IIDAvatarRenderManager;
    import com.sulake.iid.IIDHabboCommunicationManager;
    import com.sulake.iid.IIDRoomEngine;
    import __AS3__.vec.Vector;
    import flash.utils.getTimer;
    import com.sulake.core.assets.IAsset;
    import com.sulake.habbo.window.utils.SkinParserUtil;
    import com.sulake.core.window.graphics.WindowRenderer;
    import flash.geom.Rectangle;
    import com.sulake.core.window.WindowContext;
    import com.sulake.core.runtime.IIDProfiler;
    import flash.external.ExternalInterface;
    import com.sulake.habbo.utils.HabboWebTools;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.runtime.IProfiler;
    import com.sulake.core.runtime.IID;
    import com.sulake.core.runtime.IUnknown;
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.core.window.components.IFrameWindow;
    import com.sulake.core.utils.Map;
    import com.sulake.core.window.utils.DefaultAttStruct;
    import com.sulake.core.window.components.IDesktopWindow;
    import com.sulake.habbo.window.utils._Str_4045;
    import com.sulake.core.window.utils.INotify;
    import com.sulake.habbo.window.utils._Str_2418;
    import com.sulake.habbo.window.utils._Str_12599;
    import com.sulake.habbo.window.utils._Str_10548;
    import com.sulake.habbo.window.utils._Str_9679;
    import com.sulake.habbo.window.utils._Str_2910;
    import com.sulake.core.window.utils.MouseCursorControl;
    import com.sulake.core.utils.ErrorReportStorage;
    import com.sulake.habbo.tracking.HabboErrorVariableEnum;
    import com.sulake.core.window.events.WindowEvent;
    import flash.system.Capabilities;
    import com.sulake.core.window.theme.IThemeManager;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.habbo.window.widgets.WidgetClasses;
    import com.sulake.core.window.components.IWidgetWindow;
    import com.sulake.core.window.IWidget;
    import com.sulake.core.assets.IResourceManager;
    import com.sulake.habbo.window.utils.ModalDialog;
    import com.sulake.habbo.window.utils._Str_2784;
    import com.sulake.habbo.window.utils._Str_10133;
    import flash.text.StyleSheet;
    import com.sulake.core.window.events.*;
    import com.sulake.core.window.tools.*;

    public class HabboWindowManagerComponent extends Component implements IHabboWindowManager, ICoreWindowManager, IWindowFactory, IUpdateReceiver, IInputEventTracker, IWidgetFactory 
    {
        private static const _Str_16806:Event = new Event(_Str_5209.HABBO_WINDOW_TRACKING_EVENT_INPUT);
        private static const _Str_18892:Event = new Event(_Str_5209.HABBO_WINDOW_TRACKING_EVENT_RENDER);
        private static const _Str_18861:Event = new Event(_Str_5209.HABBO_WINDOW_TRACKING_EVENT_SLEEP);
        private static const _Str_8995:uint = 4;
        private static const _Str_17369:uint = 1;

        private var _localization:IHabboLocalizationManager;
        private var _windowContextArray:Array;
        private var _windowContext:IWindowContext;
        private var _windowRenderer:IWindowRenderer;
        private var _skinContainer:SkinContainer;
        private var _profiling:Boolean = false;
        private var _profilerOutput:ProfilerOutput;
        private var _profilerAgentTaskUpdate:ProfilerAgentTask;
        private var _profilerAgentTaskRedraw:ProfilerAgentTask;
        private var _themeManager:ThemeManager;
        private var _resourceManager:ResourceManager;
        private var _hintManager:HintManager;
        private var _avatarRenderer:IAvatarRenderManager;
        private var _communication:IHabboCommunicationManager;
        private var _sessionDataManager:ISessionDataManager;
        private var _isInitialized:Boolean = false;
        private var _roomEngine:IRoomEngine;
        private var _msSinceLastRoomEngineCheck:uint;
        private var _bcfloorPlanEditor:BCFloorPlanEditor;
        private var _habboPedia:_Str_7787;
        private var _habbleLinkHandler:HabbletLinkHandler;
        private var _elementPointerHandler:_Str_9474;

        public function HabboWindowManagerComponent(k:IContext, _arg_2:uint=0, _arg_3:IAssetLibrary=null)
        {
            super(k, _arg_2, _arg_3);
            FontEnum.refresh();
            HTMLTextController._Str_16826 = "habboMain";
        }

        public function get roomEngine():IRoomEngine
        {
            return this._roomEngine;
        }

        override protected function get dependencies():Vector.<ComponentDependency>
        {
            return (super.dependencies.concat(new <ComponentDependency>[new ComponentDependency(new IIDSessionDataManager(), function (k:ISessionDataManager):void
            {
                _sessionDataManager = k;
            }, false), new ComponentDependency(new IIDHabboLocalizationManager(), function (k:IHabboLocalizationManager):void
            {
                _localization = k;
            }), new ComponentDependency(new IIDHabboConfigurationManager(), function (k:IHabboConfigurationManager):void
            {
            }, false, [{
                "type":Event.COMPLETE,
                "callback":this.onConfigurationComplete
            }]), new ComponentDependency(new IIDAvatarRenderManager(), function (k:IAvatarRenderManager):void
            {
                _avatarRenderer = k;
            }, false), new ComponentDependency(new IIDHabboCommunicationManager(), this._Str_23192, false), new ComponentDependency(new IIDRoomEngine(), function (k:IRoomEngine):void
            {
                _roomEngine = k;
            }, false)]));
        }

        private function _Str_23192(k:IHabboCommunicationManager):void
        {
            this._communication = k;
        }

        private function onConfigurationComplete(k:Event):void
        {
            if (this._communication != null)
            {
                this._bcfloorPlanEditor = new BCFloorPlanEditor(this);
                this._elementPointerHandler = new _Str_9474(this);
            }
        }

        override protected function initComponent():void
        {
			try
			{
            var k:int = getTimer();
            var _local_2:IAsset = assets.getAssetByName("habbo_element_description_xml");
            this._skinContainer = new SkinContainer();
            SkinParserUtil.parse((_local_2.content as XML), assets, this._skinContainer);
            this._themeManager = new ThemeManager(this._skinContainer);
            this._resourceManager = new ResourceManager(this);
            this._hintManager = new HintManager(this);
            this._windowRenderer = new WindowRenderer(this._skinContainer);
            this._windowContextArray = new Array(_Str_8995);
            var _local_3:Rectangle = new Rectangle(0, 0, context.displayObjectContainer.stage.stageWidth, context.displayObjectContainer.stage.stageHeight);
            var _local_4:uint;
            while (_local_4 < _Str_8995)
            {
                this._windowContextArray[_local_4] = new WindowContext(("layer_" + _local_4), this._windowRenderer, this, this, this._resourceManager, this._localization, this, context.displayObjectContainer, _local_3, context.linkEventTrackers);
                _local_4++;
            }
            assets.removeAsset(_local_2);
            _local_2.dispose();
            this._windowContext = this._windowContextArray[_Str_17369];
            this._Str_11270(this);
            registerUpdateReceiver(this, 0);
            queueInterface(new IIDProfiler(), this._Str_24384);
            k = (getTimer() - k);
            Logger.log((("initializing window framework took " + k) + "ms"));
            this._isInitialized = true;
            this._habboPedia = new _Str_7787(this);
            this._habbleLinkHandler = new HabbletLinkHandler(this);
            context.addLinkEventTracker(this._habbleLinkHandler);
            if (ExternalInterface.available)
            {
                ExternalInterface.addCallback(HabboWebTools.OPENLINK, context.createLinkEvent);
            }
			}
			catch (error: Error)
			{
				Habbo.trackLoginStep("Error in initComponent; " + error.message + ", stacktrace: " + error.getStackTrace());
			}
        }

        private function _Str_26104(k:WindowMouseEvent):void
        {
            var _local_2:IWindow;
            Logger.log("CRASH!");
            _local_2.background = true;
        }

        private function _Str_24384(k:IID, _arg_2:IUnknown):void
        {
            var _local_3:IProfiler = (_arg_2 as IProfiler);
            if (_local_3 != null)
            {
                if (!this._profilerOutput)
                {
                    this._profilerOutput = new ProfilerOutput(context, this, this._windowRenderer);
                }
                this._profilerOutput.profiler = _local_3;
				this._profilerOutput.visible = true;
                this._profilerAgentTaskUpdate = new ProfilerAgentTask("Update", "Event processing");
                _local_3.getProfilerAgentForReceiver(this).addSubTask(this._profilerAgentTaskUpdate);
                this._profilerAgentTaskRedraw = new ProfilerAgentTask("Redraw", "Window rasterizer");
                _local_3.getProfilerAgentForReceiver(this).addSubTask(this._profilerAgentTaskRedraw);
                this._profiling = true;
            }
        }

        private function _Str_26100(k:IID, _arg_2:IUnknown):void
        {
        }

        override public function dispose():void
        {
            if (!disposed)
            {
                if (this._habbleLinkHandler != null)
                {
                    context.removeLinkEventTracker(this._habbleLinkHandler);
                    this._habbleLinkHandler.dispose();
                    this._habbleLinkHandler = null;
                }
                if (this._elementPointerHandler != null)
                {
                    this._elementPointerHandler.dispose();
                    this._elementPointerHandler = null;
                }
                removeUpdateReceiver(this);
                if (this._bcfloorPlanEditor != null)
                {
                    this._bcfloorPlanEditor.dispose();
                    this._bcfloorPlanEditor = null;
                }
                if (this._habboPedia)
                {
                    this._habboPedia.dispose();
                    this._habboPedia = null;
                }
                if (this._windowContextArray)
                {
                    while (this._windowContextArray.length > 0)
                    {
                        IDisposable(this._windowContextArray.pop()).dispose();
                    }
                }
                this._windowContextArray = null;
                if (this._windowRenderer)
                {
                    this._windowRenderer.dispose();
                    this._windowRenderer = null;
                }
                if (this._skinContainer)
                {
                    this._skinContainer.dispose();
                    this._skinContainer = null;
                }
                if (this._resourceManager != null)
                {
                    this._resourceManager.dispose();
                    this._resourceManager = null;
                }
                if (this._hintManager != null)
                {
                    this._hintManager.dispose();
                    this._hintManager = null;
                }
                super.dispose();
            }
        }

        public function create(k:String, _arg_2:uint, _arg_3:uint, _arg_4:uint, _arg_5:Rectangle, _arg_6:Function=null, _arg_7:String="", _arg_8:uint=0, _arg_9:Array=null, _arg_10:IWindow=null, _arg_11:Array=null, _arg_12:String=""):IWindow
        {
            return this._windowContext.create(k, _arg_7, _arg_2, _arg_3, _arg_4, _arg_5, _arg_6, _arg_10, _arg_8, _arg_11, _arg_12, _arg_9);
        }

        public function destroy(k:IWindow):void
        {
            k.destroy();
        }

        public function buildFromXML(k:XML, _arg_2:uint=1, _arg_3:Map=null):IWindow
        {
            var _local_4:IWindow = this.getWindowContext(_arg_2).getWindowParser().parseAndConstruct(k, null, _arg_3);
            if ((_local_4 is IFrameWindow))
            {
                IFrameWindow(_local_4)._Str_21008 = this.openHelpPage;
            }
            return _local_4;
        }

        public function windowToXMLString(k:IWindow):String
        {
            return this._windowContext.getWindowParser().windowToXMLString(k);
        }

        public function _Str_19128(k:uint, _arg_2:uint):XML
        {
            return this._skinContainer._Str_23436(k, _arg_2);
        }

        public function _Str_20294(k:uint, _arg_2:uint):DefaultAttStruct
        {
            return this._skinContainer._Str_21732(k, _arg_2);
        }

        public function createWindow(k:String, _arg_2:String="", _arg_3:uint=0, _arg_4:uint=0, _arg_5:uint=0, _arg_6:Rectangle=null, _arg_7:Function=null, _arg_8:uint=0, _arg_9:uint=1, _arg_10:String=""):IWindow
        {
            return this._windowContextArray[_arg_9].create(k, _arg_2, _arg_3, _arg_4, _arg_5, _arg_6, _arg_7, null, _arg_8, null, null, null);
        }

        public function removeWindow(k:String, _arg_2:uint=1):void
        {
            var _local_3:IDesktopWindow = this._windowContextArray[_arg_2].getDesktopWindow();
            var _local_4:IWindow = _local_3.getChildByName(k);
            if (_local_4 != null)
            {
                _local_4.destroy();
            }
        }

        public function getWindowByName(k:String, _arg_2:uint=1):IWindow
        {
            return this._windowContextArray[_arg_2].getDesktopWindow().getChildByName(k);
        }

        public function getActiveWindow(k:uint=1):IWindow
        {
            return this._windowContextArray[k].getDesktopWindow().getChildAt((this._windowContext.getDesktopWindow().numChildren - 1));
        }

        public function getWindowContext(k:uint):IWindowContext
        {
            return this._windowContextArray[k];
        }

        public function getDesktop(k:uint):IDesktopWindow
        {
            var _local_2:IWindowContext = this._windowContextArray[k];
            return (_local_2) ? _local_2.getDesktopWindow() : null;
        }

        public function notify(k:String, _arg_2:String, _arg_3:Function, _arg_4:uint=0):INotify
        {
            var alertAsset:IAsset = assets.getAssetByName("habbo_window_alert_xml");
            if (!alertAsset)
            {
                throw (new Error("Failed to initialize alert dialog; missing asset!"));
            }
            var _local_6:XML = (alertAsset.content as XML);
            return new _Str_4045(this, _local_6, k, _arg_2, _arg_4, _arg_3, false);
        }

        public function alert(k:String, _arg_2:String, _arg_3:uint, _arg_4:Function):_Str_2418
        {
            var alertAsset:IAsset = assets.getAssetByName("habbo_window_alert_xml");
            if (!alertAsset)
            {
                throw (new Error("Failed to initialize alert dialog; missing asset!"));
            }
            var _local_6:XML = (alertAsset.content as XML);
            return new _Str_4045(this, _local_6, k, _arg_2, _arg_3, _arg_4, false);
        }

        public function _Str_5947(k:String, _arg_2:String, _arg_3:uint, _arg_4:Function):_Str_2418
        {
            var alertAsset:IAsset = assets.getAssetByName("habbo_window_alert_xml");
            if (!alertAsset)
            {
                throw (new Error("Failed to initialize alert dialog; missing asset!"));
            }
            var _local_6:XML = (alertAsset.content as XML);
            return new _Str_4045(this, _local_6, k, _arg_2, _arg_3, _arg_4, true);
        }

        public function _Str_23503(k:String, _arg_2:String, _arg_3:String, _arg_4:String, _arg_5:uint, _arg_6:Function):_Str_10548
        {
            var alertAsset:IAsset = assets.getAssetByName("habbo_window_alert_link_xml");
            if (!alertAsset)
            {
                throw (new Error("Failed to initialize alert dialog; missing asset!"));
            }
            var _local_8:XML = (alertAsset.content as XML);
            return new _Str_12599(this, _local_8, k, _arg_2, _arg_3, _arg_4, _arg_5, _arg_6);
        }

        public function confirm(k:String, _arg_2:String, _arg_3:uint, _arg_4:Function):_Str_2910
        {
            var confirmAsset:IAsset = assets.getAssetByName("habbo_window_confirm_xml");
            if (!confirmAsset)
            {
                throw (new Error("Failed to initialize aleret dialog; missing asset!"));
            }
            var _local_6:XML = (confirmAsset.content as XML);
            return new _Str_9679(this, _local_6, k, _arg_2, _arg_3, _arg_4, false);
        }

        public function _Str_21720(k:String, _arg_2:String, _arg_3:uint, _arg_4:Function):_Str_2910
        {
            var confirmAsset:IAsset = assets.getAssetByName("habbo_window_confirm_xml");
            if (!confirmAsset)
            {
                throw (new Error("Failed to initialize aleret dialog; missing asset!"));
            }
            var _local_6:XML = (confirmAsset.content as XML);
            return new _Str_9679(this, _local_6, k, _arg_2, _arg_3, _arg_4, true);
        }

        public function registerLocalizationParameter(k:String, _arg_2:String, _arg_3:String, _arg_4:String="%"):void
        {
            this._localization.registerParameter(k, _arg_2, _arg_3, _arg_4);
        }

        public function update(k:uint):void
        {
			var _local_2:int;
			if (this._profiling)
			{
				this._profilerAgentTaskUpdate.start();
			};
			if (WindowContext._Str_4956.length > 0)
			{
				events.dispatchEvent(_Str_16806);
				_local_2 = (_Str_8995 - 1);
				while (_local_2 >= 0)
				{
					this._windowContextArray[_local_2].update(k);
					_local_2--;
				};
			};
			if (this._profiling)
			{
				this._profilerAgentTaskUpdate.stop();
			};
			if (this._profiling)
			{
				this._profilerAgentTaskRedraw.start();
			};
			events.dispatchEvent(_Str_18892);
			_local_2 = 0;
			while (_local_2 < _Str_8995)
			{
				this._windowContextArray[_local_2].render(k);
				_local_2++;
			};
			if (this._profiling)
			{
				this._profilerAgentTaskRedraw.stop();
			};
			if (WindowContext._Str_4956.length > 0)
			{
				WindowContext._Str_4956.flush();
			};
			MouseCursorControl.change();
			events.dispatchEvent(_Str_18861);
        }

        override public function purge():void
        {
            super.purge();
            if (this._windowRenderer)
            {
                this._windowRenderer.purge();
            }
        }

        public function _Str_11270(k:IInputEventTracker):void
        {
            var _local_2:IWindowContext;
            for each (_local_2 in this._windowContextArray)
            {
                _local_2._Str_11270(k);
            }
        }

        public function _Str_14802(k:IInputEventTracker):void
        {
            var _local_2:IWindowContext;
            for each (_local_2 in this._windowContextArray)
            {
                _local_2._Str_14802(k);
            }
        }

        public function eventReceived(k:WindowEvent, _arg_2:IWindow):void
        {
            if (_arg_2 != null)
            {
                if (k.type == WindowMouseEvent.CLICK)
                {
                    ErrorReportStorage.setParameter(HabboErrorVariableEnum.CLICK_TIME, new Date().getTime().toString());
                    ErrorReportStorage.setParameter(HabboErrorVariableEnum.CLICK_TARGET, ((_arg_2.name + ": ") + _arg_2.toString()));
                }
                else
                {
                    if (k.type == WindowMouseEvent.UP)
                    {
                        ErrorReportStorage.setParameter(HabboErrorVariableEnum.MOUSE_UP_TIME, new Date().getTime().toString());
                        ErrorReportStorage.setParameter(HabboErrorVariableEnum.MOUSE_UP_TARGET, ((_arg_2.name + ": ") + _arg_2.toString()));
                    }
                }
            }
        }

        private function _Str_25877():void
        {
            Logger.log(((((("type: " + Capabilities.playerType) + " debugger: ") + Capabilities.isDebugger) + " version: ") + Capabilities.version));
        }

        public function _Str_14038(k:String):IWindow
        {
            var _local_2:IWindow;
            var _local_3:IWindowContext;
            for each (_local_3 in this._windowContextArray)
            {
                _local_2 = _local_3._Str_14038(k);
                if (_local_2)
                {
                    return _local_2;
                }
            }
            return null;
        }

        public function _Str_15444(k:String):IWindow
        {
            var _local_2:IWindow;
            var _local_3:IWindowContext;
            for each (_local_3 in this._windowContextArray)
            {
                _local_2 = _local_3._Str_15444(k);
                if (_local_2)
                {
                    return _local_2;
                }
            }
            return null;
        }

        public function groupWindowsWithTag(k:String, _arg_2:Array, _arg_3:int=0):uint
        {
            var _local_5:IWindowContext;
            var _local_4:uint;
            for each (_local_5 in this._windowContextArray)
            {
                _local_4 = (_local_4 + _local_5.groupChildrenWithTag(k, _arg_2, _arg_3));
            }
            return _local_4;
        }

        public function getThemeManager():IThemeManager
        {
            return this._themeManager;
        }

        public function createUnseenItemCounter():IWindowContainer
        {
            var k:IAsset = (assets.getAssetByName("unseen_item_counter_xml") as IAsset);
            var _local_2:XML = (k.content as XML);
            return this.buildFromXML(_local_2) as IWindowContainer;
        }

        public function _Str_2548(k:String, _arg_2:IWidgetWindow):IWidget
        {
            var _local_3:Class = WidgetClasses._Str_3059[k];
            if (_local_3 != null)
            {
                return new _local_3(_arg_2, this);
            }
            throw (new Error((("Unknown widget type " + k) + "! You might need to update Glaze to be able to work on this layout.")));
        }

        public function get _Str_1458():IAvatarRenderManager
        {
            return this._avatarRenderer;
        }

        public function get resourceManager():IResourceManager
        {
            return this._resourceManager;
        }

        public function get localization():IHabboLocalizationManager
        {
            return this._localization;
        }

        public function buildModalDialogFromXML(k:XML):_Str_2784
        {
            return new ModalDialog(this, k);
        }

        public function get communication():IHabboCommunicationManager
        {
            return this._communication;
        }

        public function get sessionDataManager():ISessionDataManager
        {
            return this._sessionDataManager;
        }

        public function simpleAlert(k:String, _arg_2:String, _arg_3:String, _arg_4:String=null, _arg_5:String=null, _arg_6:Map=null, _arg_7:String=null, _arg_8:Function=null, _arg_9:Function=null):void
        {
            new _Str_10133(this, k, _arg_2, _arg_3, _arg_4, _arg_5, _arg_6, _arg_7, _arg_8, _arg_9);
        }

        public function registerHintWindow(k:String, _arg_2:IWindow, _arg_3:int=1):void
        {
            this._hintManager._Str_23129(k, _arg_2, _arg_3);
        }

        public function unregisterHintWindow(k:String):void
        {
            this._hintManager._Str_20106(k);
        }

        public function showHint(k:String, _arg_2:Rectangle=null):void
        {
            this._hintManager.showHint(k, _arg_2);
        }

        public function hideHint():void
        {
            this._hintManager.hideHint();
        }

        public function _Str_12248(k:String):void
        {
            this._hintManager._Str_12248(k);
        }

        public function displayFloorPlanEditor():void
        {
            if (this._bcfloorPlanEditor == null)
            {
                this._bcfloorPlanEditor = new BCFloorPlanEditor(this);
            }
            if (this._bcfloorPlanEditor != null)
            {
                this._bcfloorPlanEditor.visible = true;
            }
        }

        public function openHelpPage(k:String):void
        {
            if (this._habboPedia != null)
            {
                this._habboPedia.openPage(k);
            }
        }

        public function get habboPagesStyleSheet():StyleSheet
        {
            return _Str_7787.styleSheet;
        }
    }
}
