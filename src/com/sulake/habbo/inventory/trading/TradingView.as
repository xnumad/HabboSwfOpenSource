package com.sulake.habbo.inventory.trading
{
    import com.sulake.habbo.inventory.IInventoryView;
    import com.sulake.habbo.room.IGetImageListener;
    import com.sulake.habbo.window.IHabboWindowManager;
    import com.sulake.habbo.localization.IHabboLocalizationManager;
    import com.sulake.habbo.room.IRoomEngine;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.habbo.inventory.ItemPopupCtrl;
    import com.sulake.habbo.sound.IHabboSoundManager;
    import com.sulake.core.window.IWindowContainer;
    import flash.utils.Timer;
    import com.sulake.habbo.inventory.items.GroupItem;
    import com.sulake.core.assets.IAsset;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.habbo.sound.events.SongInfoReceivedEvent;
    import flash.events.TimerEvent;
    import com.sulake.core.window.components.IBitmapWrapperWindow;
    import com.sulake.core.window.components.ITextWindow;
    import flash.display.BitmapData;
    import com.sulake.core.utils.Map;
    import com.sulake.core.window.components.IItemGridWindow;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
    import com.sulake.habbo.communication.messages.incoming.inventory.trading.TradingOpenFailedEvent;
    import com.sulake.habbo.window.utils._Str_2418;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.habbo.room.ImageResult;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.habbo.inventory.items.FurnitureItem;
    import com.sulake.habbo.inventory.items.CreditTradingItem;
    import com.sulake.habbo.inventory.enum.FurniCategory;
    import com.sulake.habbo.catalog.enum.ProductTypeEnum;
    import com.sulake.habbo.session.furniture.IFurnitureData;
    import com.sulake.habbo.inventory.items.IFurnitureItem;
    import com.sulake.habbo.sound.ISongInfo;

    public class TradingView implements IInventoryView, IGetImageListener 
    {
        private static const _Str_20030:uint = 4284532064;
        private static const _Str_20416:uint = 2577770;
        public static const _Str_15142:int = 0;
        public static const _Str_15599:int = 1;
        public static const _Str_14838:int = 2;

        private var _tradingModel:TradingModel;
        private var _windowManager:IHabboWindowManager;
        private var _localization:IHabboLocalizationManager;
        private var _roomEngine:IRoomEngine;
        private var _assetLibrary:IAssetLibrary;
        private var _popupCtrl:ItemPopupCtrl;
        private var _soundManager:IHabboSoundManager;
        private var _disposed:Boolean = false;
        private var _visible:Boolean;
        private var _windowFull:IWindowContainer;
        private var _windowMin:IWindowContainer;
        private var _timer:Timer;
        private var _selection:GroupItem;
        private var _isMinimized:Boolean;
        private var _waitingSongInfo:Array;

        public function TradingView(k:TradingModel, _arg_2:IHabboWindowManager, _arg_3:IAssetLibrary, _arg_4:IRoomEngine, _arg_5:IHabboLocalizationManager, _arg_6:IHabboSoundManager)
        {
            this._waitingSongInfo = new Array();
            super();
            this._tradingModel = k;
            this._windowManager = _arg_2;
            this._localization = _arg_5;
            this._assetLibrary = _arg_3;
            this._roomEngine = _arg_4;
            this._soundManager = _arg_6;
            this._visible = false;
            var _local_7:IAsset = this._assetLibrary.getAssetByName("item_popup_xml");
            var _local_8:XmlAsset = XmlAsset(_local_7);
            var _local_9:IWindowContainer = (this._windowManager.buildFromXML((_local_8.content as XML)) as IWindowContainer);
            _local_9.visible = false;
            this._popupCtrl = new ItemPopupCtrl(_local_9, this._assetLibrary, this._windowManager, this._tradingModel);
            this._soundManager.events.addEventListener(SongInfoReceivedEvent.SIR_TRAX_SONG_INFO_RECEIVED, this._Str_3530);
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }

        public function get visible():Boolean
        {
            return this._visible;
        }

        public function get windowManager():IHabboWindowManager
        {
            return this._windowManager;
        }

        public function dispose():void
        {
            if (!this._disposed)
            {
                if (((this._windowFull) && (!(this._windowFull.disposed))))
                {
                    this._windowFull.dispose();
                    this._windowFull = null;
                }
                if (this._timer)
                {
                    this._timer.removeEventListener(TimerEvent.TIMER, this._Str_916);
                    this._timer.stop();
                    this._timer = null;
                }
                if (this._popupCtrl != null)
                {
                    this._popupCtrl.dispose();
                    this._popupCtrl = null;
                }
                if (this._soundManager)
                {
                    if (this._soundManager.events != null)
                    {
                        this._soundManager.events.removeEventListener(SongInfoReceivedEvent.SIR_TRAX_SONG_INFO_RECEIVED, this._Str_3530);
                    }
                    this._soundManager = null;
                }
                this._waitingSongInfo = null;
                this._tradingModel = null;
                this._windowManager = null;
                this._roomEngine = null;
                this._localization = null;
                this._assetLibrary = null;
                this._selection = null;
                this._visible = false;
                this._disposed = true;
            }
        }

        public function setup(k:int, _arg_2:Boolean, _arg_3:int, _arg_4:Boolean):void
        {
            this._Str_5129(false);
            this._Str_25386();
            this._Str_24229();
            if (((!(_arg_2)) && (!(_arg_4))))
            {
                this._Str_9274("${inventory.trading.warning.both_accounts_disabled}");
                this._Str_16518("");
                this._Str_16189("");
            }
            else
            {
                if (!_arg_2)
                {
                    this._Str_16518("${inventory.trading.warning.own_account_disabled}");
                }
                if (!_arg_4)
                {
                    this._Str_16189("${inventory.trading.warning.others_account_disabled}");
                }
            }
        }

        public function getWindowContainer():IWindowContainer
        {
            if (this._windowFull == null)
            {
                this._windowFull = this._Str_25571();
                this._Str_17273(null);
            }
            if (this._windowMin == null)
            {
                this._windowMin = this._Str_25632();
            }
            if (!this._isMinimized)
            {
                return this._windowFull;
            }
            return this._windowMin;
        }

        public function _Str_5129(k:Boolean=false):void
        {
            this._isMinimized = k;
        }

        public function _Str_9059(k:int):void
        {
            var _local_3:GroupItem;
            var _local_4:IWindowContainer;
            var _local_5:IBitmapWrapperWindow;
            var _local_6:ITextWindow;
            var _local_7:BitmapData;
            var _local_8:BitmapData;
            if (!this._windowFull)
            {
                return;
            }
            var _local_2:uint;
            var _local_9:* = (k == this._tradingModel._Str_21380);
            var _local_10:Map = ((_local_9) ? this._tradingModel._Str_5629 : this._tradingModel._Str_5319);
            var _local_11:IItemGridWindow = ((_local_9) ? this._Str_16996() : this._Str_18316());
            while (_local_2 < _local_10.length)
            {
                _local_3 = (_local_10.getWithIndex(_local_2) as GroupItem);
                _local_4 = (_local_11._Str_2830(_local_2) as IWindowContainer);
                if (_local_4)
                {
                    _local_4.id = _local_2;
                    while (_local_4.numChildren > 0)
                    {
                        _local_4.removeChildAt(0);
                    }
                    _local_4.addChild(_local_3.window);
                    _local_3.window.id = _local_2;
                    _local_3._Str_24322();
                }
                _local_2++;
            }
            while (_local_2 < _local_11.numGridItems)
            {
                _local_4 = (_local_11._Str_2830(_local_2) as IWindowContainer);
                if (_local_4)
                {
                    _local_4.id = _local_2;
                    _local_4.removeChildAt(0);
                    _local_4.invalidate();
                }
                _local_2++;
            }
            this._Str_19826();
        }

        public function _Str_24697():void
        {
            var k:IItemGridWindow;
            var _local_2:IWindowContainer;
            var _local_3:uint;
            k = this._Str_18316();
            _local_3 = 0;
            while (_local_3 < k.numGridItems)
            {
                _local_2 = (k._Str_2830(_local_3) as IWindowContainer);
                if (_local_2)
                {
                    _local_2.id = _local_3;
                    _local_2.removeChildAt(0);
                }
                _local_3++;
            }
            k = this._Str_16996();
            _local_3 = 0;
            while (_local_3 < k.numGridItems)
            {
                _local_2 = (k._Str_2830(_local_3) as IWindowContainer);
                if (_local_2)
                {
                    _local_2.id = _local_3;
                    _local_2.removeChildAt(0);
                }
                _local_3++;
            }
        }

        public function _Str_11244():void
        {
            var k:IWindow;
            var _local_2:ITextWindow;
            var _local_3:IStaticBitmapWrapperWindow;
            if (this._windowFull)
            {
                this._Str_19826();
                _local_2 = (this._windowFull.findChildByTag("OTHER_USER_NAME") as ITextWindow);
                if (_local_2)
                {
                    _local_2.text = this._tradingModel._Str_17035;
                }
                this._windowFull.findChildByTag("OWN_USER_ACCEPTED").visible = this._tradingModel._Str_11659;
                _local_3 = (this._windowFull.findChildByTag("OWN_USER_LOCK") as IStaticBitmapWrapperWindow);
                if (_local_3)
                {
                    _local_3.assetUri = ((this._tradingModel._Str_11659) ? "talent_locked_achievement" : "inventory_trading_trading_unlocked_icon");
                }
                this._windowFull.findChildByTag("OTHER_USER_ACCEPTED").visible = this._tradingModel._Str_21829;
                _local_3 = (this._windowFull.findChildByTag("OTHER_USER_LOCK") as IStaticBitmapWrapperWindow);
                if (_local_3)
                {
                    _local_3.assetUri = ((this._tradingModel._Str_21829) ? "talent_locked_achievement" : "inventory_trading_trading_unlocked_icon");
                }
            }
        }

        public function _Str_19826():void
        {
            var k:IWindow;
            if (this._windowFull)
            {
                k = this._windowFull.findChildByName("button_accept");
                if (!k)
                {
                    return;
                }
                if (this._tradingModel._Str_8308().getBoolean("trading.warning.enabled"))
                {
                    if (this._tradingModel._Str_24618())
                    {
                        this._Str_17273(this._localization.getLocalization("inventory.trading.warning.credits", "inventory.trading.warning.credits"));
                    }
                    else
                    {
                        this._Str_17273(null);
                    }
                }
                this._Str_25501(this._tradingModel._Str_24153, this._tradingModel._Str_25441);
                this._Str_25640(this._tradingModel._Str_24984, this._tradingModel._Str_23259);
                switch (this._tradingModel.state)
                {
                    case TradingModel._Str_5529:
                        if (((this._tradingModel._Str_5629.length > 0) || (this._tradingModel._Str_5319.length > 0)))
                        {
                            k.enable();
                        }
                        else
                        {
                            k.disable();
                        }
                        k.caption = "${inventory.trading.accept}";
                        return;
                    case TradingModel._Str_5536:
                        if (((this._tradingModel._Str_5629.length > 0) || (this._tradingModel._Str_5319.length > 0)))
                        {
                            k.enable();
                        }
                        else
                        {
                            k.disable();
                        }
                        k.caption = ((this._tradingModel._Str_11659) ? "${inventory.trading.modify}" : "${inventory.trading.accept}");
                        this._Str_9274("${inventory.trading.info.add}");
                        return;
                    case TradingModel._Str_8223:
                        k.disable();
                        k.caption = "${inventory.trading.countdown}";
                        this._Str_9274("${inventory.trading.info.confirm}");
                        return;
                    case TradingModel._Str_6408:
                        k.enable();
                        k.caption = "${inventory.trading.confirm}";
                        this._Str_9274("${inventory.trading.info.confirm}");
                        return;
                    case TradingModel._Str_8721:
                        k.disable();
                        this._Str_9274("${inventory.trading.info.waiting}");
                        return;
                    case TradingModel._Str_5869:
                        k.disable();
                        k.caption = "${inventory.trading.accept}";
                        this._Str_9274("${inventory.trading.info.confirm}");
                        return;
                    case TradingModel._Str_5812:
                        return;
                    default:
                        throw (new Error((('Unknown trading progress state: "' + this._tradingModel.state) + '"')));
                }
            }
        }

        public function _Str_9274(k:String):void
        {
            var _local_2:ITextWindow = (this._windowFull.findChildByName("help_text") as ITextWindow);
            _local_2.text = k;
            _local_2.visible = true;
        }

        private function _Str_17273(k:String):void
        {
            if (!this._windowFull)
            {
                return;
            }
            var _local_2:IWindow = this._windowFull.findChildByName("info_border_highlighted");
            if (_local_2)
            {
                _local_2.visible = (!(k == null));
            }
            var _local_3:ITextWindow = (this._windowFull.findChildByName("info_text_highlighted") as ITextWindow);
            if (_local_3)
            {
                _local_3.visible = (!(k == null));
                if (k)
                {
                    _local_3.text = k;
                }
            }
        }

        private function _Str_25501(k:int, _arg_2:int):void
        {
            this._Str_20764("content_text_1_a", k, "content_text_1_b", _arg_2, true);
        }

        private function _Str_25640(k:int, _arg_2:int):void
        {
            this._Str_20764("content_text_2_a", k, "content_text_2_b", _arg_2, false);
        }

        private function _Str_20764(k:String, _arg_2:int, _arg_3:String, _arg_4:int, _arg_5:Boolean):void
        {
            var _local_6:ITextWindow;
            if (!this._tradingModel._Str_8308().getBoolean("trading.warning.enabled"))
            {
                return;
            }
            _local_6 = (this._windowFull.findChildByName(k) as ITextWindow);
            if (_local_6)
            {
                this._localization.registerParameter("inventory.trading.info.itemcount", "value", _arg_2.toString());
                _local_6.text = this._localization.getLocalization("inventory.trading.info.itemcount");
            }
            _local_6 = (this._windowFull.findChildByName(_arg_3) as ITextWindow);
            if (_local_6)
            {
                if (_arg_5)
                {
                    this._localization.registerParameter("inventory.trading.info.creditvalue.own", "value", _arg_4.toString());
                    _local_6.text = this._localization.getLocalization("inventory.trading.info.creditvalue.own");
                }
                else
                {
                    this._localization.registerParameter("inventory.trading.info.creditvalue", "value", _arg_4.toString());
                    _local_6.text = this._localization.getLocalization("inventory.trading.info.creditvalue");
                }
            }
        }

        public function _Str_16518(k:String):void
        {
            var _local_2:ITextWindow = (this._windowFull.findChildByName("info_text_0") as ITextWindow);
            _local_2.text = k;
            _local_2.visible = true;
            var _local_3:IItemGridWindow = (this._windowFull.findChildByName("item_grid_0") as IItemGridWindow);
            if (_local_3)
            {
                _local_3.visible = false;
            }
        }

        public function _Str_25386():void
        {
            var k:ITextWindow = (this._windowFull.findChildByName("info_text_0") as ITextWindow);
            k.visible = false;
            var _local_2:IItemGridWindow = (this._windowFull.findChildByName("item_grid_0") as IItemGridWindow);
            if (_local_2)
            {
                _local_2.visible = true;
            }
        }

        public function _Str_16189(k:String):void
        {
            var _local_2:ITextWindow = (this._windowFull.findChildByName("info_text_1") as ITextWindow);
            _local_2.text = k;
            _local_2.visible = true;
            var _local_3:IItemGridWindow = (this._windowFull.findChildByName("item_grid_1") as IItemGridWindow);
            if (_local_3)
            {
                _local_3.visible = false;
            }
        }

        public function _Str_24229():void
        {
            var k:ITextWindow = (this._windowFull.findChildByName("info_text_1") as ITextWindow);
            k.visible = false;
            var _local_2:IItemGridWindow = (this._windowFull.findChildByName("item_grid_1") as IItemGridWindow);
            if (_local_2)
            {
                _local_2.visible = true;
            }
        }

        public function _Str_24174(k:TradingOpenFailedEvent):void
        {
            var _local_2:String = ("inventory.trading.openfail." + k.getParser().reason);
            this._windowManager.registerLocalizationParameter(_local_2, "otherusername", k.getParser()._Str_17035);
            this._windowManager.simpleAlert("${inventory.trading.openfail.title}", "${inventory.trading.openfail.caption}", (("${" + _local_2) + "}"));
        }

        public function _Str_17682(k:int):void
        {
            switch (k)
            {
                case _Str_15142:
                    this._windowManager.alert("${inventory.trading.notification.title}", "${inventory.trading.warning.other_not_offering}", 0, this._Str_16452);
                    return;
                case _Str_15599:
                    this._windowManager.alert("${inventory.trading.notification.title}", "${inventory.trading.info.closed}", 0, this._Str_16452);
                    return;
                case _Str_14838:
                    this._windowManager.alert("${inventory.trading.notification.title}", "${inventory.trading.info.already_open}", 0, this._Str_16452);
                    return;
            }
        }

        public function _Str_26089(title:String, description:String, callback:Function):void
        {
            this._windowManager.alert(title, description, 0, ((callback != null) ? callback : function (k:_Str_2418, _arg_2:WindowEvent):void
{
    k.dispose();
}));
        }

        public function _Str_17610():void
        {
            if (this._timer == null)
            {
                this._timer = new Timer(1000, 3);
                this._timer.addEventListener(TimerEvent.TIMER, this._Str_916);
            }
            this._timer.reset();
            this._timer.repeatCount = 3;
            this._timer.start();
            this._windowManager.registerLocalizationParameter("inventory.trading.countdown", "counter", "3");
            this._Str_11244();
        }

        public function _Str_18651():void
        {
            if (this._timer != null)
            {
                this._timer.reset();
            }
        }

        public function imageReady(k:int, _arg_2:BitmapData):void
        {
            var _local_3:uint;
            var _local_4:GroupItem;
            var _local_5:Map;
            var _local_6:Boolean;
            _local_5 = this._tradingModel._Str_5319;
            _local_6 = false;
            _local_3 = 0;
            while (_local_3 < _local_5.length)
            {
                _local_4 = (_local_5.getWithIndex(_local_3) as GroupItem);
                if (_local_4._Str_15216 == k)
                {
                    _local_4._Str_3093 = _arg_2;
                    _local_6 = true;
                }
                _local_3++;
            }
            if (_local_6)
            {
                this._Str_9059(this._tradingModel._Str_6240);
            }
            _local_5 = this._tradingModel._Str_5629;
            _local_6 = false;
            _local_3 = 0;
            while (_local_3 < _local_5.length)
            {
                _local_4 = (_local_5[_local_3] as GroupItem);
                if (_local_4._Str_15216 == k)
                {
                    _local_4._Str_3093 = _arg_2;
                    _local_6 = true;
                }
                _local_3++;
            }
            if (_local_6)
            {
                this._Str_9059(this._tradingModel._Str_21380);
            }
        }

        public function imageFailed(k:int):void
        {
        }

        public function setSelection(k:GroupItem):void
        {
            this._Str_25509();
            if (k)
            {
                this._selection = k;
                this._selection._Str_2365 = true;
            }
        }

        public function _Str_25509():void
        {
            if (this._selection)
            {
                this._selection._Str_2365 = false;
                this._selection = null;
            }
        }

        public function _Str_23654(k:int, _arg_2:BitmapData):void
        {
        }

        public function _Str_16452(k:_Str_2418, _arg_2:WindowEvent):void
        {
            if (_arg_2.type == WindowEvent.WINDOW_EVENT_OK)
            {
                k.dispose();
            }
        }

        protected function _Str_18316():IItemGridWindow
        {
            return this._windowFull.findChildByTag("OWN_USER_GRID") as IItemGridWindow;
        }

        protected function _Str_16996():IItemGridWindow
        {
            return this._windowFull.findChildByTag("OTHER_USER_GRID") as IItemGridWindow;
        }

        protected function _Str_26379(k:GroupItem):BitmapData
        {
            var _local_3:ImageResult;
            var _local_2:BitmapData = k._Str_3093;
            if (_local_2 == null)
            {
                if (k._Str_2770)
                {
                    _local_3 = this._roomEngine.getWallItemIcon(k.type, this, k.stuffData.getLegacyString());
                }
                else
                {
                    _local_3 = this._roomEngine.getFurnitureIcon(k.type, this, null, k.stuffData);
                }
                if (_local_3.id > 0)
                {
                    k._Str_15216 = _local_3.id;
                }
                _local_2 = _local_3.data;
                k._Str_3093 = _local_2;
            }
            return _local_2;
        }

        protected function _Str_25988():IWindowContainer
        {
            var k:XML = (XmlAsset(this._assetLibrary.getAssetByName("inventory_thumb_xml")).content as XML);
            return this._windowManager.buildFromXML(k) as IWindowContainer;
        }

        protected function _Str_26039(k:uint):void
        {
            var _local_2:GroupItem;
            if (((this._tradingModel == null) || (this._tradingModel._Str_5319 == null)))
            {
                return;
            }
            if (k < this._tradingModel._Str_5319.length)
            {
                _local_2 = (this._tradingModel._Str_5319.getWithIndex(k) as GroupItem);
                this.setSelection(_local_2);
                if (_local_2)
                {
                    this._tradingModel._Str_19254()._Str_12834(_local_2);
                }
            }
        }

        protected function _Str_26268(k:uint):void
        {
            var _local_2:GroupItem;
            if (((this._tradingModel == null) || (this._tradingModel._Str_5629 == null)))
            {
                return;
            }
            if (k < this._tradingModel._Str_5629.length)
            {
                _local_2 = (this._tradingModel._Str_5629.getWithIndex(k) as GroupItem);
                this.setSelection(_local_2);
                if (_local_2)
                {
                    this._tradingModel._Str_19254()._Str_12834(_local_2);
                }
            }
        }

        private function _Str_25571():IWindowContainer
        {
            var _local_3:IItemGridWindow;
            var _local_4:IWindow;
            var _local_5:IWindowContainer;
            var _local_6:uint;
            var k:XML = (XmlAsset(this._assetLibrary.getAssetByName("inventory_trading_xml")).content as XML);
            var _local_2:IWindowContainer = (this._windowManager.buildFromXML(k) as IWindowContainer);
            _local_3 = (_local_2.findChildByTag("OWN_USER_GRID") as IItemGridWindow);
            _local_6 = 0;
            while (_local_6 < _local_3.numGridItems)
            {
                _local_4 = _local_3._Str_2830(_local_6);
                _local_4.id = _local_6;
                _local_4.procedure = this._Str_16472;
                _local_4.addEventListener(WindowMouseEvent.OVER, this._Str_16472);
                _local_4.addEventListener(WindowMouseEvent.OUT, this._Str_16472);
                _local_6++;
            }
            _local_3 = (_local_2.findChildByTag("OTHER_USER_GRID") as IItemGridWindow);
            _local_6 = 0;
            while (_local_6 < _local_3.numGridItems)
            {
                _local_4 = _local_3._Str_2830(_local_6);
                _local_4.id = _local_6;
                _local_4.procedure = this._Str_16416;
                _local_4.addEventListener(WindowMouseEvent.OVER, this._Str_16416);
                _local_4.addEventListener(WindowMouseEvent.OUT, this._Str_16416);
                _local_6++;
            }
            _local_2.procedure = this._Str_3328;
            return _local_2;
        }

        private function _Str_25632():IWindowContainer
        {
            var k:XML = (XmlAsset(this._assetLibrary.getAssetByName("inventory_trading_minimized_xml")).content as XML);
            var _local_2:IWindowContainer = (this._windowManager.buildFromXML(k) as IWindowContainer);
            _local_2.procedure = this._Str_24001;
            return _local_2;
        }

        private function _Str_24001(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type == WindowMouseEvent.CLICK)
            {
                switch (_arg_2.name)
                {
                    case "button_continue":
                        this._tradingModel._Str_24199();
                        return;
                    case "button_cancel":
                        this._tradingModel._Str_14630();
                        return;
                }
            }
        }

        private function _Str_3328(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type == WindowMouseEvent.CLICK)
            {
                switch (_arg_2.name)
                {
                    case "button_accept":
                        switch (this._tradingModel.state)
                        {
                            case TradingModel._Str_5536:
                                if (((this._tradingModel._Str_5629.length == 0) && (!(this._tradingModel._Str_11659))))
                                {
                                    this._Str_17682(_Str_15142);
                                }
                                if (this._tradingModel._Str_11659)
                                {
                                    this._tradingModel._Str_24071();
                                }
                                else
                                {
                                    this._tradingModel._Str_24188();
                                }
                                break;
                            case TradingModel._Str_6408:
                                _arg_2.disable();
                                this._tradingModel._Str_25581();
                                break;
                        }
                        return;
                    case "button_cancel":
                        switch (this._tradingModel.state)
                        {
                            case TradingModel._Str_5536:
                                this._tradingModel._Str_14630();
                                break;
                            case TradingModel._Str_6408:
                                this._tradingModel._Str_24661();
                                break;
                        }
                        return;
                }
            }
        }

        private function _Str_16472(k:WindowEvent, _arg_2:IWindow):void
        {
            this._Str_21377(k, _arg_2, true);
        }

        private function _Str_16416(k:WindowEvent, _arg_2:IWindow):void
        {
            this._Str_21377(k, _arg_2, false);
        }

        private function _Str_21377(k:WindowEvent, _arg_2:IWindow, _arg_3:Boolean):void
        {
            var _local_4:GroupItem;
            var _local_5:FurnitureItem;
            var _local_6:CreditTradingItem;
            var _local_7:BitmapData;
            var _local_8:String;
            var _local_9:FurnitureItem;
            var _local_10:Date;
            if (((_arg_3) && (k.type == WindowMouseEvent.CLICK)))
            {
                this._tradingModel._Str_22686(_arg_2.id);
            }
            if (k.type == WindowMouseEvent.OVER)
            {
                if (_arg_3)
                {
                    _local_4 = this._tradingModel._Str_5319.getWithIndex(_arg_2.id);
                }
                else
                {
                    _local_4 = this._tradingModel._Str_5629.getWithIndex(_arg_2.id);
                }
                if (_local_4 == null)
                {
                    return;
                }
                _local_6 = (_local_4 as CreditTradingItem);
                if (((!(_local_6 == null)) && (!(_arg_3))))
                {
                    this._popupCtrl._Str_17992((_arg_2 as IWindowContainer), _local_6._Str_22574(), _local_6._Str_21010(), null, ItemPopupCtrl._Str_9535, false);
                    this._popupCtrl.show();
                    return;
                }
                _local_5 = _local_4._Str_3205();
                if (_local_5 == null)
                {
                    return;
                }
                _local_7 = this._tradingModel._Str_9836(_local_5);
                if (!_local_5._Str_2770)
                {
                    _local_8 = ((("$" + "{roomItem.name.") + _local_5.type) + "}");
                }
                else
                {
                    _local_8 = ((("$" + "{wallItem.name.") + _local_5.type) + "}");
                }
                if (_local_5.category == FurniCategory._Str_5186)
                {
                    _local_8 = (("${poster_" + _local_5.stuffData.getLegacyString()) + "_name}");
                }
                if (_local_5.category == FurniCategory._Str_18231)
                {
                    _local_9 = (_local_5 as FurnitureItem);
                    _local_10 = new Date(_local_9._Str_9408, (_local_9._Str_9050 - 1), _local_9._Str_8932);
                    _local_8 = ((this._localization.getLocalization(("roomItem.name." + _local_5.type)) + " ") + _local_10.toLocaleDateString());
                }
                if (_local_5.category == FurniCategory._Str_9125)
                {
                    _local_8 = this._Str_19943(_local_4, _local_8, true, _arg_2.id, _arg_3);
                }
                this._popupCtrl._Str_17992((_arg_2 as IWindowContainer), _local_8, _local_7, _local_4._Str_3205().stuffData, ItemPopupCtrl._Str_9535, this._Str_24946(_local_5));
                this._popupCtrl.show();
            }
            else
            {
                if (k.type == WindowMouseEvent.OUT)
                {
                    this._popupCtrl._Str_14093();
                }
            }
        }

        private function _Str_24946(k:FurnitureItem):Boolean
        {
            if (!this._tradingModel._Str_8308())
            {
                return false;
            }
            var _local_2:IFurnitureData = this._tradingModel._Str_8308().getFurnitureData(k.type, ProductTypeEnum.WALL);
            return (_local_2) && (_local_2.isExternalImageType);
        }

        private function _Str_19943(k:GroupItem, _arg_2:String, _arg_3:Boolean, _arg_4:int=-1, _arg_5:Boolean=false):String
        {
            var _local_6:IFurnitureItem = k._Str_3205();
            var _local_7:ISongInfo = this._soundManager._Str_2774._Str_3255(_local_6._Str_2794);
            if (_local_7 != null)
            {
                this._localization.registerParameter("songdisc.info", "name", _local_7.name);
                this._localization.registerParameter("songdisc.info", "author", _local_7.creator);
                _arg_2 = this._localization.getLocalization("songdisc.info");
            }
            else
            {
                if (_arg_3)
                {
                    if (this._waitingSongInfo.length > 0)
                    {
                        this._waitingSongInfo.pop();
                        this._waitingSongInfo.pop();
                        this._waitingSongInfo.pop();
                    }
                    this._waitingSongInfo.push(_arg_4);
                    this._waitingSongInfo.push(k);
                    this._waitingSongInfo.push(_arg_5);
                    this._soundManager._Str_2774._Str_7732(_local_6._Str_2794);
                }
            }
            return _arg_2;
        }

        private function _Str_916(k:TimerEvent):void
        {
            this._windowManager.registerLocalizationParameter("inventory.trading.countdown", "counter", String((3 - this._timer.currentCount)));
            if (this._timer.currentCount == 3)
            {
                this._tradingModel._Str_24577();
                this._timer.reset();
            }
        }

        private function _Str_3530(k:SongInfoReceivedEvent):void
        {
            var _local_2:Boolean;
            var _local_3:GroupItem;
            var _local_4:uint;
            var _local_5:FurnitureItem;
            var _local_6:String;
            var _local_7:BitmapData;
            var _local_8:IWindow;
            if (this._waitingSongInfo.length > 0)
            {
                _local_2 = this._waitingSongInfo.pop();
                _local_3 = this._waitingSongInfo.pop();
                _local_4 = this._waitingSongInfo.pop();
                _local_5 = _local_3._Str_3205();
                if (_local_5._Str_2794 == k.id)
                {
                    if ((((_local_2) && (this._tradingModel._Str_5319.getWithIndex(_local_4) == _local_3)) || ((!(_local_2)) && (this._tradingModel._Str_5629.getWithIndex(_local_4) == _local_3))))
                    {
                        _local_6 = this._Str_19943(_local_3, "", false);
                        _local_7 = this._tradingModel._Str_9836(_local_5);
                        _local_8 = ((_local_2) ? (this._Str_18316()._Str_2830(_local_4)) : this._Str_16996()._Str_2830(_local_4));
                        this._popupCtrl._Str_17992((_local_8 as IWindowContainer), _local_6, _local_7);
                    }
                }
                else
                {
                    this._waitingSongInfo.push(_local_4);
                    this._waitingSongInfo.push(_local_3);
                    this._waitingSongInfo.push(_local_2);
                }
            }
        }
    }
}
