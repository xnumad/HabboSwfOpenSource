package com.sulake.habbo.inventory.trading
{
    import com.sulake.habbo.inventory.IInventoryModel;
    import com.sulake.habbo.room.IGetImageListener;
    import com.sulake.habbo.inventory.HabboInventory;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.habbo.room.IRoomEngine;
    import com.sulake.habbo.communication.IHabboCommunicationManager;
    import com.sulake.habbo.localization.IHabboLocalizationManager;
    import com.sulake.habbo.sound.IHabboSoundManager;
    import com.sulake.core.utils.Map;
    import com.sulake.habbo.window.IHabboWindowManager;
    import com.sulake.habbo.room.object.data.StringArrayStuffData;
    import com.sulake.habbo.room.IStuffData;
    import com.sulake.habbo.inventory.enum.InventoryCategory;
    import flash.events.Event;
    import com.sulake.habbo.inventory.events.HabboInventoryTrackingEvent;
    import com.sulake.habbo.inventory.enum.InventorySubCategory;
    import com.sulake.habbo.inventory.furni.FurniModel;
    import com.sulake.habbo.communication.messages.incoming.inventory.trading._Str_6742;
    import com.sulake.habbo.inventory.items.GroupItem;
    import com.sulake.habbo.inventory.items.IFurnitureItem;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.habbo.room.ImageResult;
    import com.sulake.room.utils.Vector3d;
    import flash.display.BitmapData;
    import com.sulake.habbo.inventory.items.FurnitureItem;
    import com.sulake.habbo.communication.messages.incoming.inventory.trading.TradingCloseEvent;
    import com.sulake.habbo.communication.messages.incoming.inventory.trading.TradingOpenFailedEvent;
    import com.sulake.habbo.communication.messages.parser.inventory.trading.TradingOpenFailedEventParser;
    import com.sulake.habbo.communication.messages.incoming.inventory.trading.TradingAcceptEvent;
    import com.sulake.habbo.communication.messages.incoming.inventory.trading.TradingConfirmationEvent;
    import com.sulake.habbo.communication.messages.incoming.inventory.trading.TradingCompletedEvent;
    import com.sulake.habbo.communication.messages.parser.inventory.trading.TradingCloseParser;
    import com.sulake.habbo.communication.messages.incoming.inventory.trading.TradingNotOpenEvent;
    import com.sulake.habbo.communication.messages.incoming.inventory.trading.TradingOtherNotAllowedEvent;
    import com.sulake.habbo.communication.messages.incoming.inventory.trading.TradingYouAreNotAllowedEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.utils._Str_14579;
    import com.sulake.habbo.communication.enum.perk.PerkEnum;
    import com.sulake.habbo.communication.messages.outgoing._Str_81._Str_11737;
    import __AS3__.vec.Vector;
    import com.sulake.habbo.communication.messages.outgoing._Str_81._Str_8008;
    import com.sulake.habbo.communication.messages.outgoing._Str_81._Str_10352;
    import com.sulake.habbo.inventory.enum.FurniCategory;
    import com.sulake.habbo.communication.messages.outgoing._Str_81._Str_12206;
    import com.sulake.habbo.communication.messages.outgoing._Str_81._Str_11093;
    import com.sulake.habbo.communication.messages.outgoing._Str_81._Str_10862;
    import com.sulake.habbo.communication.messages.outgoing._Str_81._Str_11362;
    import com.sulake.habbo.communication.messages.outgoing._Str_81._Str_11536;
    import com.sulake.habbo.communication.messages.outgoing._Str_81._Str_10430;
    import __AS3__.vec.*;

    public class TradingModel implements IInventoryModel, IGetImageListener 
    {
        public static const _Str_16036:uint = 9;
        public static const _Str_5529:uint = 0;
        public static const _Str_5536:uint = 1;
        public static const _Str_8223:uint = 2;
        public static const _Str_6408:uint = 3;
        public static const _Str_8721:uint = 4;
        public static const _Str_5869:uint = 5;
        public static const _Str_5812:uint = 6;

        private var _inventory:HabboInventory;
        private var _assetLibrary:IAssetLibrary;
        private var _roomEngine:IRoomEngine;
        private var _communication:IHabboCommunicationManager;
        private var _localization:IHabboLocalizationManager;
        private var _soundManager:IHabboSoundManager;
        private var _tradingView:TradingView;
        private var _disposed:Boolean = false;
        private var _running:Boolean = false;
        private var _state:uint = 0;
        private var _ownUserIndex:int = -1;
        private var _ownUserName:String = "";
        private var _ownUserItems:Map;
        private var _ownUserNumItems:int = 0;
        private var _ownUserNumCredits:int = 0;
        private var _ownUserAccepts:Boolean = false;
        private var _ownUserCanTrade:Boolean = false;
        private var _otherUserIndex:int = -1;
        private var _otherUserName:String = "";
        private var _otherUserItems:Map;
        private var _otherUserNumItems:int = 0;
        private var _otherUserNumCredits:int = 0;
        private var _otherUserAccepts:Boolean = false;
        private var _otherUserCanTrade:Boolean = false;

        public function TradingModel(k:HabboInventory, _arg_2:IHabboWindowManager, _arg_3:IHabboCommunicationManager, _arg_4:IAssetLibrary, _arg_5:IRoomEngine, _arg_6:IHabboLocalizationManager, _arg_7:IHabboSoundManager)
        {
            this._inventory = k;
            this._communication = _arg_3;
            this._assetLibrary = _arg_4;
            this._roomEngine = _arg_5;
            this._localization = _arg_6;
            this._soundManager = _arg_7;
            this._tradingView = new TradingView(this, _arg_2, _arg_4, _arg_5, _arg_6, _arg_7);
        }

        public static function _Str_16998(k:int, _arg_2:IStuffData):String
        {
            var _local_3:String = k.toString();
            var _local_4:StringArrayStuffData = (_arg_2 as StringArrayStuffData);
            if (!_local_4)
            {
                return _local_3;
            }
            var _local_5:int = 1;
            while (_local_5 < 5)
            {
                _local_3 = (_local_3 + ("," + _local_4.getValue(_local_5)));
                _local_5++;
            }
            return _local_3;
        }


        public function get running():Boolean
        {
            return !(this._state == _Str_5529);
        }

        public function get state():uint
        {
            return this._state;
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }

        public function get _Str_6240():int
        {
            return this._ownUserIndex;
        }

        public function get _Str_16805():String
        {
            return this._ownUserName;
        }

        public function get _Str_5319():Map
        {
            return this._ownUserItems;
        }

        public function get _Str_11659():Boolean
        {
            return this._ownUserAccepts;
        }

        public function get _Str_23201():Boolean
        {
            return this._ownUserCanTrade;
        }

        public function get _Str_21380():int
        {
            return this._otherUserIndex;
        }

        public function get _Str_17035():String
        {
            return this._otherUserName;
        }

        public function get _Str_5629():Map
        {
            return this._otherUserItems;
        }

        public function get _Str_21829():Boolean
        {
            return this._otherUserAccepts;
        }

        public function get _Str_13374():Boolean
        {
            return this._otherUserCanTrade;
        }

        public function dispose():void
        {
            if (!this._disposed)
            {
                if (((this._tradingView) && (!(this._tradingView.disposed))))
                {
                    this._tradingView.dispose();
                    this._tradingView = null;
                }
                this._inventory = null;
                this._communication = null;
                this._assetLibrary = null;
                this._roomEngine = null;
                this._localization = null;
                this._disposed = true;
            }
        }

        public function _Str_23457(k:int, _arg_2:String, _arg_3:Boolean, _arg_4:int, _arg_5:String, _arg_6:Boolean):void
        {
            this._ownUserIndex = k;
            this._ownUserName = _arg_2;
            this._ownUserItems = new Map();
            this._ownUserAccepts = false;
            this._ownUserCanTrade = _arg_3;
            this._otherUserIndex = _arg_4;
            this._otherUserName = _arg_5;
            this._otherUserItems = new Map();
            this._otherUserAccepts = false;
            this._otherUserCanTrade = _arg_6;
            this._running = true;
            this.state = _Str_5536;
            this._tradingView.setup(k, _arg_3, _arg_4, _arg_6);
            this._tradingView._Str_9059(this._ownUserIndex);
            this._tradingView._Str_9059(this._otherUserIndex);
            this._tradingView._Str_11244();
            this._tradingView._Str_24697();
            this._inventory._Str_4511(InventoryCategory.FURNI);
            this._inventory.events.dispatchEvent(new Event(HabboInventoryTrackingEvent.HABBO_INVENTORY_TRACKING_EVENT_TRADING));
        }

        public function close():void
        {
            if (this._running)
            {
                if (((!(this._state == _Str_5529)) && (!(this._state == _Str_5869))))
                {
                    this._Str_14630();
                    this.state = TradingModel._Str_5812;
                }
                this.state = _Str_5529;
                this._inventory._Str_16351(InventorySubCategory.EMPTY);
                this._running = false;
            }
            this._tradingView._Str_5129(false);
        }

        public function _Str_5913(k:String):void
        {
            this._tradingView._Str_5129((!(k == InventoryCategory.FURNI)));
            this._inventory._Str_24527();
        }

        public function set state(k:uint):void
        {
            Logger.log(((((((("OLD STATE: " + this._state) + " NEW STATE: ") + k) + " OWN: ") + this._ownUserAccepts) + " OTHER: ") + this._otherUserAccepts));
            var _local_2:Boolean;
            if (this._state == k)
            {
                return;
            }
            switch (this._state)
            {
                case _Str_5529:
                    if (((k == _Str_5536) || (k == _Str_5869)))
                    {
                        this._state = k;
                        _local_2 = true;
                    }
                    break;
                case _Str_5536:
                    if (k == _Str_8223)
                    {
                        this._state = k;
                        _local_2 = true;
                        this._Str_17610();
                    }
                    else
                    {
                        if (k == _Str_5812)
                        {
                            this._state = k;
                            this._tradingView._Str_5129(false);
                            _local_2 = true;
                        }
                    }
                    break;
                case _Str_8223:
                    if (k == _Str_6408)
                    {
                        this._state = k;
                        _local_2 = true;
                    }
                    else
                    {
                        if (k == _Str_5812)
                        {
                            this._state = k;
                            this._tradingView._Str_5129(false);
                            _local_2 = true;
                        }
                        else
                        {
                            if (k == _Str_5536)
                            {
                                this._state = k;
                                _local_2 = true;
                                this._Str_18651();
                            }
                        }
                    }
                    break;
                case _Str_6408:
                    if (k == _Str_8721)
                    {
                        this._state = k;
                        _local_2 = true;
                    }
                    else
                    {
                        if (k == _Str_5869)
                        {
                            this._state = k;
                            _local_2 = true;
                            this.close();
                        }
                        else
                        {
                            if (k == _Str_5812)
                            {
                                this._state = k;
                                this._tradingView._Str_5129(false);
                                _local_2 = true;
                                this.close();
                            }
                        }
                    }
                    break;
                case _Str_8721:
                    if (k == _Str_5869)
                    {
                        this._state = k;
                        this._tradingView._Str_5129(false);
                        _local_2 = true;
                        this.close();
                    }
                    else
                    {
                        if (k == _Str_5812)
                        {
                            this._state = k;
                            this._tradingView._Str_5129(false);
                            _local_2 = true;
                            this.close();
                        }
                    }
                    break;
                case _Str_5869:
                    if (k == _Str_5529)
                    {
                        this._state = k;
                        _local_2 = true;
                    }
                    break;
                case _Str_5812:
                    if (k == _Str_5529)
                    {
                        this._state = k;
                        _local_2 = true;
                    }
                    else
                    {
                        if (k == _Str_5536)
                        {
                            this._state = k;
                            _local_2 = true;
                        }
                    }
                    break;
                default:
                    throw (new Error((('Unknown trading progress state: "' + this._state) + '"')));
            }
            if (_local_2)
            {
                this._tradingView._Str_11244();
            }
            else
            {
                throw (new Error(((("Error assigning trading process status! States does not match: (from) " + this._state) + " (to) ") + k)));
            }
        }

        public function _Str_19254():FurniModel
        {
            return this._inventory._Str_2834;
        }

        public function _Str_8308():HabboInventory
        {
            return this._inventory;
        }

        public function _Str_25000(k:_Str_6742, _arg_2:Map, _arg_3:Map):void
        {
            if (this._inventory == null)
            {
                return;
            }
            if (this._ownUserItems != null)
            {
                this._ownUserItems.dispose();
            }
            if (this._otherUserItems != null)
            {
                this._otherUserItems.dispose();
            }
            if (k._Str_15162 == this._ownUserIndex)
            {
                this._ownUserItems = _arg_2;
                this._ownUserNumItems = k._Str_14946;
                this._ownUserNumCredits = k._Str_15709;
                this._otherUserItems = _arg_3;
                this._otherUserNumItems = k._Str_13801;
                this._otherUserNumCredits = k._Str_9138;
            }
            else
            {
                this._ownUserItems = _arg_3;
                this._ownUserNumItems = k._Str_13801;
                this._ownUserNumCredits = k._Str_9138;
                this._otherUserItems = _arg_2;
                this._otherUserNumItems = k._Str_14946;
                this._otherUserNumCredits = k._Str_15709;
            }
            this._ownUserAccepts = false;
            this._otherUserAccepts = false;
            this._tradingView._Str_9059(this._ownUserIndex);
            this._tradingView._Str_9059(this._otherUserIndex);
            this._tradingView._Str_11244();
            var _local_4:FurniModel = this._inventory._Str_2834;
            if (_local_4 != null)
            {
                _local_4._Str_17963();
            }
        }

        public function _Str_21112():Array
        {
            var _local_2:GroupItem;
            var _local_3:IFurnitureItem;
            var _local_5:int;
            var k:Array = new Array();
            if (((this._ownUserItems == null) || (this._ownUserItems.disposed)))
            {
                return k;
            }
            var _local_4:int;
            while (_local_4 < this._ownUserItems.length)
            {
                _local_2 = (this._ownUserItems.getWithIndex(_local_4) as GroupItem);
                if (_local_2 != null)
                {
                    _local_5 = 0;
                    while (_local_5 < _local_2.getTotalCount())
                    {
                        _local_3 = _local_2._Str_5087(_local_5);
                        if (_local_3 != null)
                        {
                            k.push(_local_3.ref);
                        }
                        _local_5++;
                    }
                }
                _local_4++;
            }
            return k;
        }

        public function get _Str_24153():int
        {
            return this._ownUserNumItems;
        }

        public function get _Str_25441():int
        {
            return this._ownUserNumCredits;
        }

        public function get _Str_24984():int
        {
            return this._otherUserNumItems;
        }

        public function get _Str_23259():int
        {
            return this._otherUserNumCredits;
        }

        public function getWindowContainer():IWindowContainer
        {
            return this._tradingView.getWindowContainer();
        }

        public function _Str_4889():void
        {
        }

        public function _Str_5813(k:String):void
        {
            if (this._running)
            {
                if (this._state != _Str_5529)
                {
                    this._Str_14630();
                }
            }
        }

        public function _Str_5100():void
        {
            if (this._running)
            {
                this.close();
            }
        }

        public function _Str_17610():void
        {
            this._tradingView._Str_17610();
        }

        public function _Str_18651():void
        {
            this._tradingView._Str_18651();
        }

        public function _Str_24577():void
        {
            if (this._state == _Str_8223)
            {
                this.state = _Str_6408;
            }
        }

        public function _Str_9836(k:FurnitureItem):BitmapData
        {
            var _local_2:ImageResult;
            if (!k._Str_2770)
            {
                _local_2 = this._roomEngine.getFurnitureImage(k.type, new Vector3d(180, 0, 0), 64, this, 0, String(k._Str_2794), -1, -1, k.stuffData);
            }
            else
            {
                _local_2 = this._roomEngine.getWallItemImage(k.type, new Vector3d(180, 0, 0), 64, this, 0, k.stuffData.getLegacyString());
            }
            return _local_2.data as BitmapData;
        }

        public function imageReady(k:int, _arg_2:BitmapData):void
        {
            this._tradingView._Str_23654(k, _arg_2);
        }

        public function imageFailed(k:int):void
        {
        }

        public function _Str_6457(k:IMessageEvent):void
        {
            var _local_2:TradingCloseEvent;
            if ((k is TradingOpenFailedEvent))
            {
                Logger.log("TRADING::TradingOpenFailedEvent");
                if (this._Str_17680)
                {
                    this._tradingView._Str_24174(TradingOpenFailedEvent(k));
                }
                else
                {
                    if (((TradingOpenFailedEvent(k).getParser().reason == TradingOpenFailedEventParser._Str_18150) || (TradingOpenFailedEvent(k).getParser().reason == TradingOpenFailedEventParser._Str_18383)))
                    {
                        this._tradingView._Str_17682(TradingView._Str_14838);
                    }
                }
            }
            else
            {
                if ((k is TradingAcceptEvent))
                {
                    Logger.log("TRADING::TradingAcceptEvent");
                    if (TradingAcceptEvent(k)._Str_4963 == this._ownUserIndex)
                    {
                        this._ownUserAccepts = (!(TradingAcceptEvent(k)._Str_15794 == 0));
                    }
                    else
                    {
                        this._otherUserAccepts = (!(TradingAcceptEvent(k)._Str_15794 == 0));
                    }
                    this._tradingView._Str_11244();
                }
                else
                {
                    if ((k is TradingConfirmationEvent))
                    {
                        Logger.log("TRADING::TradingConfirmationEvent");
                        this.state = _Str_8223;
                    }
                    else
                    {
                        if ((k is TradingCompletedEvent))
                        {
                            Logger.log("TRADING::TradingCompletedEvent");
                            this.state = _Str_5869;
                        }
                        else
                        {
                            if ((k is TradingCloseEvent))
                            {
                                Logger.log("TRADING::TradingCloseEvent");
                                if (!this._running)
                                {
                                    Logger.log("Received TradingCloseEvent, but trading already stopped!!!");
                                    return;
                                }
                                _local_2 = (k as TradingCloseEvent);
                                if (_local_2.getParser().reason == TradingCloseParser.ERROR_WHILE_COMMIT)
                                {
                                    if (this._inventory.getBoolean("trading.commiterror.enabled"))
                                    {
                                        this._tradingView.windowManager.simpleAlert("${inventory.trading.notification.title}", "${inventory.trading.notification.commiterror.caption}", "${inventory.trading.notification.commiterror.info}");
                                    }
                                }
                                else
                                {
                                    if (_local_2.getParser()._Str_4963 != this._ownUserIndex)
                                    {
                                        this._tradingView._Str_17682(TradingView._Str_15599);
                                    }
                                }
                                this.close();
                            }
                            else
                            {
                                if ((k is TradingNotOpenEvent))
                                {
                                    Logger.log("TRADING::TradingNotOpenEvent");
                                }
                                else
                                {
                                    if ((k is TradingOtherNotAllowedEvent))
                                    {
                                        this._tradingView._Str_16189("${inventory.trading.warning.others_account_disabled}");
                                    }
                                    else
                                    {
                                        if ((k is TradingYouAreNotAllowedEvent))
                                        {
                                            this._tradingView._Str_16518("${inventory.trading.warning.own_account_disabled}");
                                        }
                                        else
                                        {
                                            Logger.log(("TRADING/Unknown message event: " + k));
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }

        public function _Str_24199():void
        {
            this._inventory._Str_4511(InventoryCategory.FURNI);
        }

        public function _Str_24442(k:int):void
        {
            if (_Str_14579.isPerkAllowed(this._inventory._Str_2627, this._inventory.windowManager, PerkEnum.TRADE))
            {
                this._communication.connection.send(new _Str_11737(k));
            }
        }

        public function _Str_24612(k:Vector.<int>, _arg_2:Boolean, _arg_3:int, _arg_4:int, _arg_5:Boolean, _arg_6:IStuffData):void
        {
            var _local_7:Vector.<int>;
            var _local_8:int;
            if (((!(_arg_5)) && (k.length > 0)))
            {
                this._communication.connection.send(new _Str_8008(k.pop()));
            }
            else
            {
                _local_7 = new Vector.<int>();
                for each (_local_8 in k)
                {
                    if (this._Str_24974(_arg_2, _arg_3, _arg_4, _arg_5, _arg_6))
                    {
                        _local_7.push(_local_8);
                    }
                }
                if (_local_7.length > 0)
                {
                    if (_local_7.length == 1)
                    {
                        this._communication.connection.send(new _Str_8008(_local_7.pop()));
                    }
                    else
                    {
                        this._communication.connection.send(new _Str_10352(_local_7));
                    }
                }
            }
        }

        public function _Str_24974(k:Boolean, _arg_2:int, _arg_3:int, _arg_4:Boolean, _arg_5:IStuffData):Boolean
        {
            var _local_6:String;
            if (this._ownUserAccepts)
            {
                return false;
            }
            if (this._ownUserItems == null)
            {
                return false;
            }
            if (this._ownUserItems.length < _Str_16036)
            {
                return true;
            }
            if (!_arg_4)
            {
                return false;
            }
            _local_6 = String(_arg_2);
            if (_arg_3 == FurniCategory._Str_5186)
            {
                _local_6 = ((String(_arg_2) + "poster") + _arg_5.getLegacyString());
            }
            else
            {
                if (_arg_3 == FurniCategory._Str_12454)
                {
                    _local_6 = _Str_16998(_arg_2, _arg_5);
                }
                else
                {
                    _local_6 = (((k) ? "I" : "S") + _local_6);
                }
            }
            return !(this._ownUserItems.getValue(_local_6) == null);
        }

        public function _Str_22686(k:int):void
        {
            var _local_3:IFurnitureItem;
            if (this._ownUserAccepts)
            {
                return;
            }
            var _local_2:GroupItem = this._Str_5319.getWithIndex(k);
            if (_local_2)
            {
                _local_3 = _local_2._Str_3205();
                if (_local_3)
                {
                    this._communication.connection.send(new _Str_12206(_local_3.id));
                }
            }
        }

        public function _Str_24188():void
        {
            this._communication.connection.send(new _Str_11093());
        }

        public function _Str_24071():void
        {
            this._communication.connection.send(new _Str_10862());
        }

        public function _Str_25581():void
        {
            this.state = _Str_8721;
            this._communication.connection.send(new _Str_11362());
        }

        public function _Str_24661():void
        {
            this._communication.connection.send(new _Str_11536());
        }

        public function _Str_14630():void
        {
            this._communication.connection.send(new _Str_10430());
        }

        public function _Str_24618():Boolean
        {
            return (this._ownUserNumCredits > 0) || (this._otherUserNumCredits > 0);
        }

        private function get _Str_17680():Boolean
        {
            return this._inventory.getBoolean("talent.track.citizenship.enabled");
        }

        public function _Str_2491():void
        {
        }

        public function _Str_5725(k:String):void
        {
            Logger.log("NOT SUPPORTED: TRADING VIEW SELECT BY ID");
        }
    }
}
