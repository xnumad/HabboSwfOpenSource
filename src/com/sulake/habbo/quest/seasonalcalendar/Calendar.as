package com.sulake.habbo.quest.seasonalcalendar
{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.core.runtime.IUpdateReceiver;
    import com.sulake.habbo.quest.HabboQuestEngine;
    import __AS3__.vec.Vector;
    import flash.display.BitmapData;
    import com.sulake.core.utils.Map;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.components.IBitmapWrapperWindow;
    import flash.utils.Timer;
    import com.sulake.habbo.communication.messages.incoming.quest._Str_2455;
    import com.sulake.core.assets.IAsset;
    import flash.events.TimerEvent;
    import com.sulake.core.window.components.IFrameWindow;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.components.IBorderWindow;
    import com.sulake.core.window.components.ITextWindow;
    import flash.net.URLRequest;
    import com.sulake.core.assets.AssetLoaderStruct;
    import com.sulake.core.assets.loaders.AssetLoaderEvent;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.events.WindowEvent;
    import __AS3__.vec.*;

    public class Calendar implements IDisposable, IUpdateReceiver 
    {
        private static const BACKGROUND_:String = "background_";
        private static const DAY:String = "day";
        private static const _UNCOMPLETE:String = "_uncomplete";
        private static const _COMPLETED:String = "_completed";
        private static const _Str_17255:int = 2;
        private static const _Str_14469:int = 3;
        private static const _Str_6370:int = 80;
        private static const _Str_16834:int = 37;
        private static const _Str_11600:int = 7;
        private static const _Str_17373:int = 5;
        private static const _Str_13135:int = 2000;
        private static const _Str_16510:int = 100;

        private var _questEngine:HabboQuestEngine;
        private var _mainWindow:MainWindow;
        private var _quests:Array;
        private var _backgroundImageCache:Vector.<BitmapData>;
        private var _graphicEntityCache:Vector.<BitmapData>;
        private var _assetNameToIndexMap:Map;
        private var _bgAssetNameArray:Array;
        private var _imageGalleryHost:String;
        private var _bgRenderer:CalendarBackgroundRenderer;
        private var _entityWindows:Vector.<IWindowContainer>;
        private var _states:Array;
        private var _leftArrow:CalendarArrowButton;
        private var _rightArrow:CalendarArrowButton;
        private var _containerWindow:IWindowContainer;
        private var _entityWindowTemplate:IWindowContainer;
        private var _backgroundSlice:IBitmapWrapperWindow;
        private var _viewIndex:int = -1;
        private var _totalEntityCount:int = -1;
        private var _highestAvailableQuestIndex:int = -1;
        private var _maximumEntities:int = 42;
        private var _scrollTimer:Timer;
        private var _scrollOffset:int = 0;
        private var _scrollDelta:int = 0;
        private var _scrollBgStartOffset:int = 0;
        private var _flashingPanelIndex:int = -1;
        private var _flashingOffsetMs:int;
        private var _hoveringIndex:int = -1;
        private var _scrollLeftPressed:Boolean = false;
        private var _scrollRightPressed:Boolean = false;
        private var _dateRefreshTimer:Timer;
        private var _lastDate:int = -1;

        public function Calendar(k:HabboQuestEngine, _arg_2:MainWindow)
        {
            this._questEngine = k;
            this._mainWindow = _arg_2;
        }

        private static function _Str_21268(k:uint, _arg_2:int):uint
        {
            var _local_3:int = Math.min(0xFF, Math.max(0, (((k >> 16) & 0xFF) + _arg_2)));
            var _local_4:int = Math.min(0xFF, Math.max(0, (((k >> 8) & 0xFF) + _arg_2)));
            var _local_5:int = Math.min(0xFF, Math.max(0, ((k & 0xFF) + _arg_2)));
            return (((_local_3 & 0xFF) << 16) + ((_local_4 & 0xFF) << 8)) + (_local_5 & 0xFF);
        }


        private function _Str_22523():String
        {
            return this._imageGalleryHost;
        }

        public function dispose():void
        {
            if (!this.disposed)
            {
                this._questEngine.removeUpdateReceiver(this);
                this._Str_17476();
                if (this._bgRenderer != null)
                {
                    this._bgRenderer.dispose();
                    this._bgRenderer = null;
                }
                if (this._leftArrow != null)
                {
                    this._leftArrow.dispose();
                    this._leftArrow = null;
                }
                if (this._rightArrow != null)
                {
                    this._rightArrow.dispose();
                    this._rightArrow = null;
                }
                if (this._scrollTimer != null)
                {
                    this._scrollTimer.stop();
                    this._scrollTimer = null;
                }
                if (this._dateRefreshTimer != null)
                {
                    this._dateRefreshTimer.stop();
                    this._dateRefreshTimer = null;
                }
                this._backgroundImageCache = null;
                this._graphicEntityCache = null;
                this._states = null;
                this._assetNameToIndexMap = null;
                this._bgAssetNameArray = null;
                this._questEngine = null;
            }
        }

        public function get disposed():Boolean
        {
            return this._questEngine == null;
        }

        public function _Str_8212(k:Array):void
        {
            var _local_2:Date = new Date();
            this._lastDate = _local_2.getDate();
            var _local_3:int = this._totalEntityCount;
            this._quests = [];
            this._highestAvailableQuestIndex = 0;
            var _local_4:_Str_2455;
            for each (_local_4 in k)
            {
                if (this._questEngine._Str_7575(_local_4))
                {
                    this._quests.push(_local_4);
                    if (this._highestAvailableQuestIndex < (_local_4.sortOrder - 1))
                    {
                        this._highestAvailableQuestIndex = (_local_4.sortOrder - 1);
                    }
                }
            }
            this._quests.sortOn(["sortOrder"]);
            this._maximumEntities = int(this._questEngine.configuration.getProperty("seasonalQuestCalendar.maximum.entities"));
            this._totalEntityCount = Math.min(this._maximumEntities, ((this._highestAvailableQuestIndex + 1) + _Str_17255));
            if (((!(_local_3 == -1)) && (this._totalEntityCount > _local_3)))
            {
                this._Str_20728();
            }
        }

        public function prepare(k:IFrameWindow):void
        {
            var _local_2:IBitmapWrapperWindow;
            this._imageGalleryHost = this._mainWindow._Str_22087();
            this._containerWindow = IWindowContainer(k.findChildByName("calendar_cont"));
            this._backgroundSlice = IBitmapWrapperWindow(k.findChildByName("background_slice"));
            this._entityWindowTemplate = IWindowContainer(k.findChildByName("entity_template"));
            this._entityWindowTemplate.visible = false;
            this._bgRenderer = new CalendarBackgroundRenderer();
            this._leftArrow = new CalendarArrowButton(this._questEngine.assets, IBitmapWrapperWindow(k.findChildByName("button_left")), CalendarArrowButton._Str_14486, this._Str_20617);
            this._rightArrow = new CalendarArrowButton(this._questEngine.assets, IBitmapWrapperWindow(k.findChildByName("button_right")), CalendarArrowButton._Str_13915, this._Str_20617);
            _local_2 = IBitmapWrapperWindow(k.findChildByName("stripe_mask_left"));
            _local_2.bitmap = BitmapData(IAsset(this._questEngine.assets.getAssetByName("stripe_mask_L")).content);
            _local_2 = IBitmapWrapperWindow(k.findChildByName("stripe_mask_right"));
            _local_2.bitmap = BitmapData(IAsset(this._questEngine.assets.getAssetByName("stripe_mask_R")).content);
            if (this._viewIndex == -1)
            {
                this._Str_25787(this._mainWindow._Str_5472);
            }
            this._Str_20728();
            var _local_3:Date = new Date();
            this._lastDate = _local_3.getDate();
            this._dateRefreshTimer = new Timer(((1000 * 60) * _Str_17373));
            this._dateRefreshTimer.addEventListener(TimerEvent.TIMER, this._Str_20564);
            this._dateRefreshTimer.start();
            this._Str_20564(new TimerEvent(TimerEvent.TIMER));
            this._questEngine.registerUpdateReceiver(this, 1);
            this._scrollTimer = new Timer(10, 10);
        }

        public function close():void
        {
            this._Str_17476();
            if (this._bgRenderer != null)
            {
                this._bgRenderer._Str_17621(new Vector.<BitmapData>());
            }
        }

        public function refresh():void
        {
            var k:_Str_2455;
            var _local_2:int;
            var _local_3:int;
            for each (k in this._quests)
            {
                _local_2 = (k.sortOrder - 1);
                _local_3 = ((k._Str_6695) ? CalendarEntityStateEnums._Str_6598 : this._states[_local_2]);
                if (_local_3 != this._states[_local_2])
                {
                    this._Str_10587(k.sortOrder, _local_3);
                    this._Str_12604(_local_2, false);
                    if (((_local_3 == CalendarEntityStateEnums._Str_6598) && (this._flashingPanelIndex == _local_2)))
                    {
                        this._Str_23591();
                    }
                }
            }
            this._Str_17497();
            this._Str_18525();
        }

        public function _Str_25787(k:int):void
        {
            this._Str_17875(Math.max(0, Math.min((k - _Str_14469), this._Str_20265)));
        }

        private function _Str_20728():void
        {
            var _local_5:_Str_2455;
            var _local_7:int;
            var _local_8:Boolean;
            var _local_9:int;
            var k:int = (Math.ceil((this._totalEntityCount / _Str_11600)) + 1);
            this._bgAssetNameArray = new Array(k);
            this._backgroundImageCache = new Vector.<BitmapData>(k);
            this._graphicEntityCache = new Vector.<BitmapData>(this._totalEntityCount);
            this._states = new Array(this._totalEntityCount);
            var _local_2:Vector.<BitmapData> = new Vector.<BitmapData>();
            var _local_3:int;
            while (_local_3 < k)
            {
                _local_2.push(new BitmapData(640, 320, false, 0xFFFFFF));
                _local_3++;
            }
            this._bgRenderer._Str_17621(_local_2);
            var _local_4:int = this._Str_19819;
            while (_local_4 <= this._Str_21863)
            {
                this._Str_19830(_local_4);
                _local_4++;
            }
            this._assetNameToIndexMap = new Map();
            for each (_local_5 in this._quests)
            {
                if (_local_5.sortOrder <= this._maximumEntities)
                {
                    _local_7 = ((_local_5._Str_6695) ? CalendarEntityStateEnums._Str_6598 : CalendarEntityStateEnums._Str_4670);
                    _local_8 = (((_local_5.sortOrder - 1) >= this._Str_16038) && ((_local_5.sortOrder - 1) <= this._Str_13332));
                    this._Str_10587(_local_5.sortOrder, _local_7, (!(_local_8)));
                }
            }
            if (this._quests.length < this._totalEntityCount)
            {
                _local_9 = (this._highestAvailableQuestIndex + 1);
                while (_local_9 < this._totalEntityCount)
                {
                    this._Str_10587((_local_9 + 1), CalendarEntityStateEnums._Str_10437, (_local_9 > this._Str_13332));
                    _local_9++;
                }
            }
            var _local_6:int;
            while (_local_6 < this._totalEntityCount)
            {
                if (this._states[_local_6] == null)
                {
                    this._Str_10587((_local_6 + 1), CalendarEntityStateEnums._Str_11118, ((_local_6 < this._Str_16038) || (_local_6 > this._Str_13332)));
                }
                _local_6++;
            }
        }

        private function _Str_17497():void
        {
            var _local_4:int;
            var _local_5:BitmapData;
            if (!this._Str_20367())
            {
                return;
            }
            var k:Array = new Array();
            var _local_2:Vector.<BitmapData> = new Vector.<BitmapData>();
            var _local_3:int;
            while (_local_3 < this._backgroundImageCache.length)
            {
                _local_5 = this._backgroundImageCache[_local_3];
                if (_local_5 != null)
                {
                    _local_2.push(_local_5);
                }
                else
                {
                    _local_2.push(new BitmapData(640, 320, false, 0xFFFFFF));
                    k.push(_local_3);
                }
                _local_3++;
            }
            this._bgRenderer._Str_17621(_local_2);
            this._Str_21328();
            for each (_local_4 in k)
            {
                this._Str_19830(_local_4);
            }
        }

        private function _Str_17476():void
        {
            var k:IWindow;
            if (this._entityWindows == null)
            {
                return;
            }
            for each (k in this._entityWindows)
            {
                this._containerWindow.removeChild(k);
                k.dispose();
            }
            this._entityWindows = null;
        }

        private function _Str_18525():void
        {
            var _local_2:BitmapData;
            var _local_3:IWindow;
            var _local_4:IWindow;
            var _local_5:int;
            var _local_6:IWindowContainer;
            var _local_7:int;
            var _local_8:IWindow;
            var _local_9:IBitmapWrapperWindow;
            if (!this._Str_19327())
            {
                return;
            }
            this._Str_17476();
            if (this._entityWindows == null)
            {
                this._entityWindows = new Vector.<IWindowContainer>();
            }
            var k:Array = new Array();
            for each (_local_2 in this._graphicEntityCache)
            {
                _local_6 = IWindowContainer(this._entityWindowTemplate.clone());
                _local_7 = this._entityWindows.length;
                if (_local_2 != null)
                {
                    _local_9 = (_local_6.findChildByName("entity_bitmap") as IBitmapWrapperWindow);
                    _local_9.width = _local_2.width;
                    _local_9.height = _local_2.height;
                    _local_9.bitmap = _local_2.clone();
                }
                else
                {
                    k.push(_local_7);
                }
                _local_8 = _local_6.findChildByName("entity_mouse_region");
                _local_8.procedure = this._Str_25473;
                if ((((this._states[_local_7] == CalendarEntityStateEnums._Str_10437) || (this._states[_local_7] == CalendarEntityStateEnums._Str_6598)) || (this._states[_local_7] == CalendarEntityStateEnums._Str_11118)))
                {
                    _local_8.visible = false;
                }
                _local_6.visible = true;
                this._containerWindow.addChild(_local_6);
                this._entityWindows.push(_local_6);
                this._Str_12604(_local_7, false);
            }
            this._Str_18500();
            this._Str_16447();
            _local_3 = this._containerWindow.findChildByName("stripe_mask_left");
            this._containerWindow.setChildIndex(_local_3, (this._containerWindow.numChildren - 1));
            _local_3 = this._containerWindow.findChildByName("stripe_mask_right");
            this._containerWindow.setChildIndex(_local_3, (this._containerWindow.numChildren - 1));
            _local_4 = this._containerWindow.findChildByName("button_left");
            this._containerWindow.setChildIndex(_local_4, (this._containerWindow.numChildren - 1));
            _local_4 = this._containerWindow.findChildByName("button_right");
            this._containerWindow.setChildIndex(_local_4, (this._containerWindow.numChildren - 1));
            for each (_local_5 in k)
            {
                this._Str_10587((_local_5 + 1), this._states[_local_5]);
            }
            if (this._states[(this._mainWindow._Str_5472 - 1)] == CalendarEntityStateEnums._Str_4670)
            {
                this._Str_25266((this._mainWindow._Str_5472 - 1));
            }
        }

        private function get _Str_16038():int
        {
            var k:int = (this._viewIndex - 1);
            return (k < 0) ? 0 : k;
        }

        private function get _Str_13332():int
        {
            var k:int = ((this._viewIndex + _Str_11600) + 1);
            var _local_2:int = (this._totalEntityCount - 1);
            return (k > _local_2) ? _local_2 : k;
        }

        private function _Str_19327():Boolean
        {
            if (this._graphicEntityCache == null)
            {
                return false;
            }
            var k:int = this._Str_16038;
            while (k <= this._Str_13332)
            {
                if (this._graphicEntityCache[k] == null)
                {
                    return false;
                }
                k++;
            }
            return true;
        }

        private function get _Str_19819():int
        {
            var k:int = this._Str_9194(this._viewIndex);
            var _local_2:int = this._bgRenderer._Str_17008(k);
            return (_local_2 < 0) ? 0 : _local_2;
        }

        private function get _Str_21863():int
        {
            var k:int = this._Str_9194(this._viewIndex);
            return this._bgRenderer._Str_17008((k + 640));
        }

        private function _Str_20367():Boolean
        {
            if (this._backgroundImageCache == null)
            {
                return false;
            }
            var k:int = this._Str_9194(this._viewIndex);
            var _local_2:int = this._Str_19819;
            while (_local_2 <= this._Str_21863)
            {
                if (this._backgroundImageCache[_local_2] == null)
                {
                    return false;
                }
                _local_2++;
            }
            return true;
        }

        private function _Str_12604(k:int, _arg_2:Boolean):void
        {
            var _local_8:BitmapData;
            var _local_9:String;
            if (((this._entityWindows == null) || (this._entityWindows.length < (k - 1))))
            {
                return;
            }
            var _local_3:IBorderWindow = IBorderWindow(this._entityWindows[k].findChildByName("entity_indicator"));
            var _local_4:uint = CalendarEntityStateEnums._Str_15574[this._states[k]];
            if (_arg_2)
            {
                _local_4 = (_local_4 + 0x202020);
            }
            if (this._flashingPanelIndex != k)
            {
                _local_3.color = _local_4;
            }
            var _local_5:IBitmapWrapperWindow = IBitmapWrapperWindow(this._entityWindows[k].findChildByName("entity_indicator_status"));
            if (this._states[k] == CalendarEntityStateEnums._Str_6598)
            {
                _local_8 = BitmapData(this._questEngine.assets.getAssetByName("calendar_quest_complete").content);
                _local_5.width = _local_8.width;
                _local_5.height = _local_8.height;
                _local_5.bitmap = _local_8.clone();
            }
            else
            {
                _local_5.bitmap = null;
            }
            var _local_6:ITextWindow = (_local_3.findChildByName("entity_indicator_text") as ITextWindow);
            var _local_7:_Str_2455 = this._Str_19266(k);
            if (_local_7 != null)
            {
                _local_6.text = this._questEngine._Str_15926(_local_7);
            }
            else
            {
                _local_9 = _Str_2455._Str_18415(((this._questEngine._Str_9628() + "_") + (k + 1)));
                _local_6.text = this._questEngine._Str_21680(_local_9);
            }
        }

        private function _Str_10587(k:int, _arg_2:int, _arg_3:Boolean=false):void
        {
            var _local_4:String = (DAY + k);
            switch (_arg_2)
            {
                case CalendarEntityStateEnums._Str_4670:
                case CalendarEntityStateEnums._Str_10437:
                case CalendarEntityStateEnums._Str_11118:
                    _local_4 = (_local_4 + _UNCOMPLETE);
                    break;
                case CalendarEntityStateEnums._Str_6598:
                    _local_4 = (_local_4 + _COMPLETED);
                    break;
            }
            this._states[(k - 1)] = _arg_2;
            this._assetNameToIndexMap[_local_4] = (k - 1);
            var _local_5:IAsset = this._questEngine.assets.getAssetByName(_local_4);
            if (_local_5 != null)
            {
                this._Str_19114(_local_4);
                this._Str_18525();
            }
            else
            {
                if (!_arg_3)
                {
                    this._Str_21142(_local_4, this._Str_23214);
                }
            }
        }

        private function _Str_19830(k:int):void
        {
            var _local_2:String = (BACKGROUND_ + (k + 1));
            this._bgAssetNameArray[k] = _local_2;
            var _local_3:IAsset = this._questEngine.assets.getAssetByName(_local_2);
            if (_local_3 != null)
            {
                this._Str_20095(_local_2);
                this._Str_17497();
            }
            else
            {
                this._Str_21142(_local_2, this._Str_22625);
            }
        }

        private function _Str_21142(k:String, _arg_2:Function):void
        {
            var _local_3:* = ((this._Str_22523() + k) + ".png");
            var _local_4:URLRequest = new URLRequest(_local_3);
            var _local_5:AssetLoaderStruct = this._questEngine.assets.loadAssetFromFile(k, _local_4, "image/png");
            if (((_local_5) && (!(_local_5.disposed))))
            {
                _local_5.addEventListener(AssetLoaderEvent.ASSETLOADEREVENTCOMPLETE, _arg_2);
                _local_5.addEventListener(AssetLoaderEvent.ASSETLOADEREVENTERROR, _arg_2);
            }
        }

        private function _Str_22625(k:AssetLoaderEvent):void
        {
            var _local_2:AssetLoaderStruct = (k.target as AssetLoaderStruct);
            if (_local_2 != null)
            {
                this._Str_20095(_local_2.assetName);
            }
            this._Str_17497();
        }

        private function _Str_23214(k:AssetLoaderEvent):void
        {
            var _local_2:AssetLoaderStruct = (k.target as AssetLoaderStruct);
            if (_local_2 != null)
            {
                this._Str_19114(_local_2.assetName);
            }
            this._Str_18525();
        }

        private function _Str_20095(k:String):void
        {
            var _local_2:int = this._bgAssetNameArray.indexOf(k);
            if (_local_2 == -1)
            {
                return;
            }
            var _local_3:IAsset = this._questEngine.assets.getAssetByName(k);
            this._backgroundImageCache[_local_2] = ((_local_3 != null) ? (_local_3.content as BitmapData) : new BitmapData(640, 320));
        }

        private function _Str_19114(k:String):void
        {
            var _local_2:IAsset = this._questEngine.assets.getAssetByName(k);
            var _local_3:int = this._assetNameToIndexMap[k];
            if (((_local_3 == -1) || (_local_3 >= this._graphicEntityCache.length)))
            {
                return;
            }
            this._graphicEntityCache[_local_3] = ((_local_2 != null) ? (_local_2.content as BitmapData) : new BitmapData(1, 1, true, 0));
        }

        private function _Str_18500():void
        {
            if (this._entityWindows == null)
            {
                return;
            }
            var k:int;
            while (k < this._entityWindows.length)
            {
                this._entityWindows[k].x = ((((k - this._viewIndex) * _Str_6370) + this._scrollOffset) + _Str_16834);
                k++;
            }
        }

        private function _Str_9194(k:int):int
        {
            return k * _Str_6370;
        }

        private function _Str_21328():void
        {
            var k:BitmapData = this._bgRenderer._Str_16235(this._Str_9194(this._viewIndex), this._containerWindow.width);
            this._backgroundSlice.x = 0;
            this._backgroundSlice.width = k.width;
            this._backgroundSlice.height = k.height;
            this._backgroundSlice.bitmap = k.clone();
        }

        private function _Str_23116(k:int):void
        {
            var _local_2:BitmapData;
            var _local_3:int;
            var _local_4:int;
            var _local_5:int;
            var _local_6:int;
            if (k < this._viewIndex)
            {
                _local_3 = (this._viewIndex - k);
                _local_4 = this._Str_9194(k);
                _local_2 = this._bgRenderer._Str_16235(_local_4, (this._containerWindow.width + (_Str_6370 * _local_3)));
                this._scrollBgStartOffset = -(_Str_6370 * _local_3);
            }
            else
            {
                _local_5 = (k - this._viewIndex);
                _local_6 = ((_Str_6370 * _local_5) + this._containerWindow.width);
                _local_2 = this._bgRenderer._Str_16235(this._Str_9194(this._viewIndex), _local_6);
                this._scrollBgStartOffset = 0;
            }
            this._backgroundSlice.x = this._scrollBgStartOffset;
            if (_local_2 != null)
            {
                this._backgroundSlice.width = _local_2.width;
                this._backgroundSlice.height = _local_2.height;
                this._backgroundSlice.bitmap = _local_2.clone();
            }
        }

        private function _Str_25210():void
        {
            this._backgroundSlice.x = (this._scrollBgStartOffset + this._scrollOffset);
        }

        private function _Str_17875(k:int):void
        {
            if (((k < 0) || (k >= this._totalEntityCount)))
            {
                return;
            }
            if (((!(this._scrollTimer == null)) && (this._scrollTimer.running)))
            {
                return;
            }
            if (!this._Str_19327())
            {
                this._viewIndex = k;
                this._Str_21747();
                return;
            }
            var _local_2:int = this._viewIndex;
            this._viewIndex = k;
            if (this._Str_20367())
            {
                this._viewIndex = _local_2;
                this._Str_23116(k);
                this._Str_16447(true, (k - this._viewIndex));
                this._scrollDelta = (-(_Str_6370 * (k - this._viewIndex)) / 10);
                this._scrollTimer = new Timer(10, 10);
                this._scrollTimer.addEventListener(TimerEvent.TIMER, this.onTimer);
                this._scrollTimer.addEventListener(TimerEvent.TIMER_COMPLETE, this.onTimer);
                this._scrollTimer.start();
            }
            else
            {
                this._viewIndex = _local_2;
            }
        }

        private function get _Str_20265():int
        {
            return this._maximumEntities - 7;
        }

        private function _Str_21747():void
        {
            if (this._viewIndex > 0)
            {
                this._leftArrow.activate();
            }
            else
            {
                this._leftArrow.deactivate();
            }
            if (this._viewIndex < Math.min(((this._totalEntityCount - _Str_14469) - 1), this._Str_20265))
            {
                this._rightArrow.activate();
            }
            else
            {
                this._rightArrow.deactivate();
            }
        }

        private function _Str_16447(k:Boolean=false, _arg_2:int=0):void
        {
            var _local_3:int;
            var _local_4:int;
            var _local_5:int;
            if (this._entityWindows != null)
            {
                _local_3 = (this._viewIndex - 1);
                if (((k) && (_arg_2 < 0)))
                {
                    _local_3 = (_local_3 + _arg_2);
                }
                _local_4 = ((this._viewIndex + _Str_11600) + 1);
                if (((k) && (_arg_2 > 0)))
                {
                    _local_4 = (_local_4 + _arg_2);
                }
                _local_5 = 0;
                while (_local_5 < this._entityWindows.length)
                {
                    if (((_local_5 < _local_3) || (_local_5 > _local_4)))
                    {
                        this._entityWindows[_local_5].visible = false;
                    }
                    else
                    {
                        this._entityWindows[_local_5].visible = true;
                        if (((_local_5 == _local_3) || (_local_5 == _local_4)))
                        {
                            this._entityWindows[_local_5].getChildByName("entity_mouse_region").visible = false;
                        }
                        else
                        {
                            if (this._states[_local_5] == CalendarEntityStateEnums._Str_4670)
                            {
                                this._entityWindows[_local_5].getChildByName("entity_mouse_region").visible = true;
                            }
                        }
                    }
                    _local_5++;
                }
            }
        }

        private function onTimer(k:TimerEvent):void
        {
            switch (k.type)
            {
                case TimerEvent.TIMER:
                    this._scrollOffset = (this._scrollOffset + this._scrollDelta);
                    this._Str_25210();
                    this._Str_18500();
                    return;
                case TimerEvent.TIMER_COMPLETE:
                    this._scrollOffset = 0;
                    if (this._scrollDelta > 0)
                    {
                        this._viewIndex = (this._viewIndex - 1);
                    }
                    else
                    {
                        this._viewIndex = (this._viewIndex + 1);
                    }
                    this._Str_21328();
                    this._Str_18500();
                    this._Str_21747();
                    this._Str_16447();
                    this._scrollTimer.removeEventListener(TimerEvent.TIMER, this.onTimer);
                    this._scrollTimer.removeEventListener(TimerEvent.TIMER_COMPLETE, this.onTimer);
                    return;
            }
        }

        private function _Str_20617(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type == WindowMouseEvent.DOWN)
            {
                switch (_arg_2.name)
                {
                    case "button_left":
                        this._scrollLeftPressed = true;
                        break;
                    case "button_right":
                        this._scrollRightPressed = true;
                        break;
                }
            }
            if (((k.type == WindowMouseEvent.UP) || (k.type == WindowMouseEvent.UP_OUTSIDE)))
            {
                this._scrollLeftPressed = false;
                this._scrollRightPressed = false;
            }
        }

        private function _Str_25473(k:WindowEvent, _arg_2:IWindow):void
        {
            var _local_3:int;
            var _local_4:_Str_2455;
            if (_arg_2.name == "entity_mouse_region")
            {
                _local_3 = this._entityWindows.indexOf((_arg_2.parent as IWindowContainer));
                if (k.type == WindowMouseEvent.CLICK)
                {
                    _local_4 = this._Str_19266(_local_3);
                    if (_local_4 != null)
                    {
                        this._questEngine._Str_3398._Str_11417._Str_8199(_local_4, true);
                    }
                }
                if (k.type == WindowMouseEvent.OVER)
                {
                    this._Str_12604(_local_3, true);
                    this._hoveringIndex = _local_3;
                }
                if (k.type == WindowMouseEvent.OUT)
                {
                    this._Str_12604(_local_3, false);
                    this._hoveringIndex = -1;
                }
            }
        }

        private function _Str_19266(k:int):_Str_2455
        {
            var _local_2:_Str_2455;
            for each (_local_2 in this._quests)
            {
                if ((_local_2.sortOrder - 1) == k)
                {
                    return _local_2;
                }
            }
            return null;
        }

        public function update(k:uint):void
        {
            var _local_2:int;
            var _local_3:Number;
            var _local_4:IBorderWindow;
            var _local_5:Number;
            if (((!(this._entityWindows == null)) && (!(this._flashingPanelIndex == -1))))
            {
                _local_2 = CalendarEntityStateEnums._Str_15574[this._states[this._flashingPanelIndex]];
                _local_3 = (Number((this._flashingOffsetMs % _Str_13135)) / _Str_13135);
                _local_3 = Math.abs((2 * ((_local_3 > 0.5) ? --_local_3 : _local_3)));
                _local_4 = IBorderWindow(this._entityWindows[this._flashingPanelIndex].findChildByName("entity_indicator"));
                if (_local_4)
                {
                    _local_5 = (_local_3 * _Str_16510);
                    if (this._hoveringIndex == this._flashingPanelIndex)
                    {
                        _local_5 = (_local_5 + 20);
                    }
                    _local_4.color = _Str_21268(_local_2, _local_5);
                }
                this._flashingOffsetMs = (this._flashingOffsetMs + k);
            }
            if (this._scrollTimer != null)
            {
                if ((((this._scrollLeftPressed) && (!(this._scrollTimer.running))) && (this._scrollOffset == 0)))
                {
                    if (((this._viewIndex > 0) && (!(this._leftArrow._Str_21953()))))
                    {
                        this._Str_17875((this._viewIndex - 1));
                    }
                }
                if ((((this._scrollRightPressed) && (!(this._scrollTimer.running))) && (this._scrollOffset == 0)))
                {
                    if (((this._viewIndex < this._highestAvailableQuestIndex) && (!(this._rightArrow._Str_21953()))))
                    {
                        this._Str_17875((this._viewIndex + 1));
                    }
                }
            }
        }

        private function _Str_25266(k:int):void
        {
            if (((k < 0) || (k >= this._totalEntityCount)))
            {
                return;
            }
            this._flashingPanelIndex = k;
            this._flashingOffsetMs = 0;
        }

        private function _Str_23591():void
        {
            this._flashingPanelIndex = -1;
        }

        private function _Str_20564(k:TimerEvent):void
        {
            var _local_2:Date = new Date();
            if (this._lastDate != _local_2.getDate())
            {
                this._questEngine._Str_9649();
            }
            this._lastDate = _local_2.getDate();
        }
    }
}
