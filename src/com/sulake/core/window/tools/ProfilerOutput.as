package com.sulake.core.window.tools
{
    import flash.geom.Point;
    import com.sulake.core.runtime.IProfiler;
    import com.sulake.core.runtime.ICore;
    import com.sulake.core.window.components.IFrameWindow;
    import com.sulake.core.window.ICoreWindowManager;
    import com.sulake.core.window.graphics.IWindowRenderer;
    import com.sulake.core.utils.Map;
    import com.sulake.core.runtime.IContext;
    import flash.utils.ByteArray;
    import com.sulake.core.window.components.ILabelWindow;
    import com.sulake.core.runtime.IIDProfiler;
    import com.sulake.core.runtime.IID;
    import com.sulake.core.runtime.IUnknown;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.components.IItemListWindow;
    import flash.events.Event;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.components.IBitmapWrapperWindow;
    import com.sulake.core.window.enum.WindowState;
    import com.sulake.core.utils.profiler.ProfilerAgentTask;
    import flash.display.BitmapData;
    import flash.geom.Rectangle;
    import com.sulake.core.window.tools.binaryData.*;

    public class ProfilerOutput implements IDevTool 
    {
        private static const ZERO_POINT:Point = new Point();
        private static var _Str_15863:Class = ProfilerOutput__Str_15863;
        private static var _Str_15882:Class = ProfilerOutput__Str_15882;

        private var _disposed:Boolean = false;
        private var _profilerComponent:IProfiler;
        private var _core:ICore;
        private var _window:IFrameWindow;
        private var _windowItemArray:Array;
        private var _windowManager:ICoreWindowManager;
        private var _windowRenderer:IWindowRenderer;
        private var _memoryTracking:Boolean = false;
        private var _windowToTaskMap:Map;

        public function ProfilerOutput(context:IContext, windowManager:ICoreWindowManager, windowRenderer:IWindowRenderer)
        {
            this._core = (context as ICore);
            this._windowItemArray = new Array();
            this._profilerComponent = this.profiler;
            this._windowManager = windowManager;
            this._windowRenderer = windowRenderer;
            this._windowToTaskMap = new Map();
        }

        private static function padAlign(k:String, _arg_2:int, _arg_3:String=" ", _arg_4:Boolean=false):String
        {
            var _local_5:int = (_arg_2 - k.length);
            if (_local_5 <= 0)
            {
                return k.substring(0, _arg_2);
            }
            var _local_6:String = "";
            var _local_7:int;
            while (_local_7 < _local_5)
            {
                _local_6 = (_local_6 + _arg_3);
                _local_7++;
            }
            return (_arg_4) ? (_local_6 + k) : (k + _local_6);
        }


        public function get caption():String
        {
            return "Component Profiler";
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }

        public function get visible():Boolean
        {
            return (this._window) && (this._window.visible);
        }

        public function set visible(value:Boolean):void
        {
            var bytes:ByteArray;
            var xml:XML;
            if (((!(this._window)) && (value)))
            {
                bytes = (new _Str_15863() as ByteArray);
                xml = new XML(bytes.readUTFBytes(bytes.length));
                this._window = (this._windowManager.buildFromXML(xml, 2) as IFrameWindow);
                this._window.procedure = this.profilerWindowEventProc;
                this._window.findChildByName("header").caption = (((((((padAlign("task", 28) + "|") + padAlign("#rounds", 8)) + "|") + padAlign("latest ms", 8)) + "|") + padAlign("total ms", 8)) + "|");
                this._window.findChildByName("footer").caption = "<- Click to enable bitmap memory tracking";
                ILabelWindow(this._window.findChildByName("footer")).textColor = 4284900966;
            }
            if (this._window)
            {
                if (value)
                {
                    this._window.activate();
                    this._core.setProfilerMode(true);
                    this._core.queueInterface(new IIDProfiler(), function (k:IID, _arg_2:IUnknown):void
                    {
                        profiler = (_arg_2 as IProfiler);
                    });
                }
                else
                {
                    this._core.setProfilerMode(false);
                    this._window.dispose();
                    this._window = null;
                }
            }
        }

        public function set profiler(k:IProfiler):void
        {
            if (this._profilerComponent)
            {
                this._profilerComponent.removeStopEventListener(this.refresh);
                this._profilerComponent = null;
            }
            if (((!(this._profilerComponent)) && (k)))
            {
                this._profilerComponent = k;
                this._profilerComponent.addStopEventListener(this.refresh);
            }
        }

        public function get profiler():IProfiler
        {
            return this._profilerComponent;
        }

        public function dispose():void
        {
            if (!this._disposed)
            {
                if (this._window)
                {
                    this._window.dispose();
                    this._window = null;
                }
                this._profilerComponent.removeStopEventListener(this.refresh);
                this._profilerComponent = null;
                this._windowManager = null;
                this._windowRenderer = null;
                this._windowToTaskMap.dispose();
                this._windowToTaskMap = null;
                this._disposed = true;
            }
        }

        private function profilerWindowEventProc(windowEvent:WindowEvent, window:IWindow):void
        {
            if (windowEvent.type == WindowMouseEvent.CLICK)
            {
                if (window.tags.indexOf("close") > -1)
                {
                    this.visible = false;
                }
                else
                {
                    if (window.name == "button_gc")
                    {
                        this._profilerComponent.gc();
                    }
                }
            }
            if (window.name == "footer_enable_toggle")
            {
                if (windowEvent.type == WindowEvent.WINDOW_EVENT_SELECTED)
                {
                    this._memoryTracking = true;
                    ILabelWindow(this._window.findChildByName("footer")).textColor = 0xFF000000;
                }
                else
                {
                    if (windowEvent.type == WindowEvent.WINDOW_EVENT_UNSELECTED)
                    {
                        this._memoryTracking = false;
                        ILabelWindow(this._window.findChildByName("footer")).textColor = 4284900966;
                    }
                }
            }
        }

        public function refresh(k:Event):void
        {
            if (!this._window)
            {
                return;
            }
            this._windowToTaskMap.reset();
            var _local_2:Array = this._profilerComponent.getProfilerAgentsInArray();
            var _local_3:IItemListWindow = (this._window.findChildByName("list") as IItemListWindow);
            var _local_4:uint;
            while (_local_2.length > 0)
            {
                _local_4 = this.recursiveRedraw(_local_2.pop(), _local_3, _local_4, 0);
            }
            if (this._memoryTracking)
            {
                this._window.findChildByName("footer").caption = (((((((((((("Assets - Libraries: " + this._profilerComponent.numAssetLibraryInstances) + " ") + "Bitmaps: ") + this._profilerComponent.numBitmapAssetInstances) + " / ") + this._profilerComponent.numAllocatedBitmapDataBytes) + " bytes \n") + "Tracked bitmap data: ") + this._profilerComponent.numTrackedBitmapDataInstances) + " / ") + this._profilerComponent.numTrackedBitmapDataBytes) + " bytes");
            }
        }

        private function recursiveRedraw(k:ProfilerAgentTask, _arg_2:IItemListWindow, _arg_3:uint, _arg_4:uint):uint
        {
            var _local_5:IWindowContainer;
            var _local_9:IBitmapWrapperWindow;
            if (_arg_3 >= _arg_2.numListItems)
            {
                _local_5 = this.createListItem(_arg_2);
            }
            else
            {
                _local_5 = (_arg_2.getListItemAt(_arg_3) as IWindowContainer);
            }
            var _local_6:String = k.name;
            if (_arg_4 > 0)
            {
                _local_6 = padAlign(_local_6, (_arg_4 + _local_6.length), "-", true);
            }
            var _local_7:IWindow = (_local_5.findChildByName("text") as IWindow);
            _local_7.caption = (((((((padAlign(_local_6, 28, " ", false) + "|") + padAlign(String(k.rounds), 8, " ", true)) + "|") + padAlign(String(k.latest), 8, " ", true)) + "|") + padAlign(String(k.total), 8, " ", true)) + "|\r");
            _local_5.findChildByName("caption").caption = k.caption;
            _local_5.findChildByName("check").setStateFlag(WindowState.SELECTED, (!(k.paused)));
            this._windowToTaskMap.add(_local_5, k);
            if (!k.paused)
            {
                _local_9 = (_local_5.findChildByName("canvas") as IBitmapWrapperWindow);
                this.refreshBitmapImage(_local_9, k);
            }
            _arg_3++;
            var _local_8:uint;
            while (_local_8 < k.numSubTasks)
            {
                _arg_3 = this.recursiveRedraw(k.getSubTaskAt(_local_8), _arg_2, _arg_3, (_arg_4 + 1));
                _local_8++;
            }
            return _arg_3;
        }

        private function refreshBitmapImage(k:IBitmapWrapperWindow, _arg_2:ProfilerAgentTask):void
        {
            var _local_3:BitmapData = k.bitmap;
            if (_local_3 == null)
            {
                _local_3 = new BitmapData(k.width, k.height, false, 0xFFFFFFFF);
                k.bitmap = _local_3;
            }
            var _local_4:Rectangle = _local_3.rect;
            var _local_5:int = _arg_2.latest;
            var _local_6:int = ((_local_5 > _local_3.height) ? _local_3.height : _local_5);
            _local_4.x = (_local_4.x + 1);
            _local_4.width--;
            _local_3.copyPixels(_local_3, _local_4, ZERO_POINT);
            _local_4.x = (_local_4.x + (_local_4.width - 2));
            _local_4.y = (_local_4.y + (_local_4.height - _local_6));
            _local_4.width = 1;
            _local_4.height = _local_6;
            _local_3.fillRect(_local_4, ((_local_5 > _local_3.height) ? 0xFFFF0000 : 0xFF0000FF));
            k.invalidate();
        }

        private function createListItem(k:IItemListWindow):IWindowContainer
        {
            var _local_2:ByteArray = (new _Str_15882() as ByteArray);
            var _local_3:XML = new XML(_local_2.readUTFBytes(_local_2.length));
            var _local_4:IWindowContainer = (this._windowManager.buildFromXML(_local_3, 2) as IWindowContainer);
            k.addListItem(_local_4);
            var _local_5:IWindow = _local_4.findChildByName("check");
            _local_5.addEventListener(WindowMouseEvent.CLICK, this.onCheckMouseClick);
            return _local_4;
        }

        private function onCheckMouseClick(k:WindowEvent):void
        {
            var _local_2:IWindow = k.window;
            var _local_3:ProfilerAgentTask = this._windowToTaskMap.getValue(_local_2.parent);
            if (_local_3)
            {
                _local_3.paused = (!(_local_2.getStateFlag(WindowState.SELECTED)));
            }
        }
    }
}
