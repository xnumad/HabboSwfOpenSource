package com.sulake.habbo.inventory.items
{
    import com.sulake.habbo.room.IGetImageListener;
    import com.sulake.core.utils.Map;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.habbo.inventory.furni.FurniModel;
    import com.sulake.habbo.room.IRoomEngine;
    import com.sulake.habbo.room.IStuffData;
    import flash.display.BitmapData;
    import com.sulake.core.window.IWindow;
    import com.sulake.habbo.inventory.enum.FurniCategory;
    import com.sulake.habbo.sound.events.SongInfoReceivedEvent;
    import com.sulake.habbo.room.ImageResult;
    import __AS3__.vec.Vector;
    import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.core.window.components.IBitmapWrapperWindow;
    import com.sulake.core.window.components.IWidgetWindow;
    import com.sulake.habbo.window.widgets._Str_3353;
    import com.sulake.habbo.window.widgets._Str_3083;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.habbo.sound.ISongInfo;
    import __AS3__.vec.*;

    public class GroupItem implements IGetImageListener 
    {
        private static const INVENTORY_THUMB_XML:String = "inventory_thumb_xml";
        private static const _Str_4072:int = 0xCCCCCC;
        private static const _Str_4169:int = 10275685;

        private const _Str_18094:Number = 1;
        private const _Str_18535:Number = 0.2;

        protected var _Str_1636:Map;
        protected var _window:IWindowContainer;
        protected var _Str_2307:FurniModel;
        private var _type:int;
        private var _roomEngine:IRoomEngine;
        private var _Str_1352:Boolean;
        private var _Str_1007:Boolean;
        private var _category:int;
        private var _stuffData:IStuffData;
        private var _Str_3182:Number;
        private var _Str_7053:int = 0;
        private var _Str_3155:BitmapData;
        private var _Str_3412:int;
        private var _Str_10374:Boolean;
        private var _Str_14011:Boolean;
        private var _Str_19058:Boolean;
        private var _icon:BitmapData;
        private var _Str_2779:IWindow;
        private var _Str_8275:Boolean;
        private var _Str_8894:Boolean;
        private var _alignment:String = "center";
        private var _Str_2367:Boolean = false;
        private var _name:String = "";
        private var _description:String = "";
        private var _Str_14420:int = -1;
        private var _Str_4881:int = -1;

        public function GroupItem(k:FurniModel, _arg_2:int, _arg_3:int, _arg_4:IRoomEngine, _arg_5:Boolean, _arg_6:IStuffData, _arg_7:Number, _arg_8:BitmapData, _arg_9:Boolean, _arg_10:String)
        {
            this._Str_2307 = k;
            this._type = _arg_2;
            this._roomEngine = _arg_4;
            this._Str_14011 = _arg_5;
            this._Str_1636 = new Map();
            this._category = _arg_3;
            this._stuffData = _arg_6;
            this._Str_3182 = _arg_7;
            this._alignment = _arg_10;
            this._icon = _arg_8;
            this._Str_19058 = _arg_9;
            switch (this._category)
            {
                case FurniCategory._Str_3639:
                    this._name = this._Str_2307.controller.localization.getLocalization("inventory.furni.item.wallpaper.name");
                    this._description = this._Str_2307.controller.localization.getLocalization("inventory.furni.item.wallpaper.desc");
                    break;
                case FurniCategory._Str_3683:
                    this._name = this._Str_2307.controller.localization.getLocalization("inventory.furni.item.floor.name");
                    this._description = this._Str_2307.controller.localization.getLocalization("inventory.furni.item.floor.desc");
                    break;
                case FurniCategory._Str_3432:
                    this._name = this._Str_2307.controller.localization.getLocalization("inventory.furni.item.landscape.name");
                    this._description = this._Str_2307.controller.localization.getLocalization("inventory.furni.item.landscape.desc");
                    break;
            }
            this._Str_2307._Str_2476.events.addEventListener(SongInfoReceivedEvent.SIR_TRAX_SONG_INFO_RECEIVED, this._Str_3530);
        }

        public function get _Str_23694():Boolean
        {
            return (this._Str_2367) && (this._Str_10374);
        }

        public function get _Str_26366():Boolean
        {
            return this._Str_7053 == -1;
        }

        public function get window():IWindowContainer
        {
            if (!this._Str_2367)
            {
                this._Str_22349();
            }
            if (this._window == null)
            {
                return null;
            }
            if (this._window.disposed)
            {
                return null;
            }
            return this._window;
        }

        public function get _Str_6879():Boolean
        {
            return this._Str_1352;
        }

        public function set _Str_6879(k:Boolean):void
        {
            this._Str_1352 = k;
        }

        public function get _Str_2365():Boolean
        {
            return this._Str_1007;
        }

        public function set _Str_2365(k:Boolean):void
        {
            if (this._Str_1007 != k)
            {
                this._Str_1007 = k;
                this._Str_8706();
            }
        }

        public function get type():int
        {
            return this._type;
        }

        public function get _Str_3093():BitmapData
        {
            return this._Str_3155;
        }

        public function set _Str_3093(k:BitmapData):void
        {
            this._Str_3155 = k;
        }

        public function get _Str_15216():int
        {
            return this._Str_7053;
        }

        public function set _Str_15216(k:int):void
        {
            this._Str_7053 = k;
        }

        public function get previewCallbackId():int
        {
            return this._Str_3412;
        }

        public function set previewCallbackId(k:int):void
        {
            this._Str_3412 = k;
        }

        public function get category():int
        {
            return this._category;
        }

        public function get stuffData():IStuffData
        {
            return this._stuffData;
        }

        public function get _Str_2794():Number
        {
            return this._Str_3182;
        }

        public function set _Str_14978(k:Boolean):void
        {
            if (this._Str_14011 != k)
            {
                this._Str_14011 = k;
                this._Str_12824();
            }
        }

        public function get _Str_6126():Boolean
        {
            return this._Str_8275;
        }

        public function set _Str_6126(k:Boolean):void
        {
            if (this._Str_8275 != k)
            {
                this._Str_8275 = k;
                this._Str_13259();
            }
        }

        public function get alignment():String
        {
            return this._alignment;
        }

        public function get _Str_2770():Boolean
        {
            var k:FurnitureItem = this._Str_5087(0);
            return (k) ? k._Str_2770 : false;
        }

        public function get flatId():int
        {
            var k:FurnitureItem = this._Str_5087(0);
            return (k) ? k.flatId : -1;
        }

        public function get isGroupable():Boolean
        {
            var k:FurnitureItem = this._Str_5087(0);
            return (k) ? k._Str_13551 : true;
        }

        public function get _Str_3459():Boolean
        {
            var k:FurnitureItem = this._Str_5087(0);
            return (k) ? k.rentable : false;
        }

        public function get name():String
        {
            return this._name;
        }

        public function get description():String
        {
            return this._description;
        }

        public function dispose():void
        {
            if (this._Str_2307._Str_2476)
            {
                if (this._Str_2307._Str_2476.events != null)
                {
                    this._Str_2307._Str_2476.events.removeEventListener(SongInfoReceivedEvent.SIR_TRAX_SONG_INFO_RECEIVED, this._Str_3530);
                }
            }
            this._Str_2307 = null;
            this._Str_2779 = null;
            this._roomEngine = null;
            if (this._Str_1636)
            {
                this._Str_1636.dispose();
                this._Str_1636 = null;
            }
            this._stuffData = null;
            if (this._window)
            {
                this._window.dispose();
            }
        }

        public function _Str_24322():void
        {
            if (this._window)
            {
                this._window.procedure = null;
            }
        }

        public function _Str_20973(k:Boolean=true):void
        {
            var _local_2:ImageResult;
            if (this._Str_3155 != null)
            {
                return;
            }
            if (this._Str_10374)
            {
                return;
            }
            if (this._Str_2770)
            {
                _local_2 = this._roomEngine.getWallItemIcon(this._type, this, this._stuffData.getLegacyString());
            }
            else
            {
                _local_2 = this._roomEngine.getFurnitureIcon(this._type, this, String(this._Str_3182), this._stuffData);
            }
            if (_local_2.id > 0)
            {
                if (k)
                {
                    this._Str_22544(_local_2.data);
                }
                this._Str_7053 = _local_2.id;
            }
            else
            {
                this._Str_19507(_local_2.data);
                this._Str_7053 = -1;
            }
            this._Str_10374 = true;
        }

        public function push(k:FurnitureItem, _arg_2:Boolean=false):void
        {
            var _local_3:FurnitureItem = this._Str_1636.getValue(k.id);
            if (_local_3 == null)
            {
                this._Str_1636.add(k.id, k);
            }
            else
            {
                _local_3.locked = false;
            }
            this._Str_7686();
            this._Str_8706();
            if (((this._name == null) || (this._name.length == 0)))
            {
                this._name = this._Str_20913();
            }
            if (((this._description == null) || (this._description.length == 0)))
            {
                this._description = this._Str_21119();
            }
            if (_arg_2 != this._Str_8275)
            {
                this._Str_8275 = _arg_2;
                this._Str_13259();
            }
        }

        public function unshift(k:FurnitureItem):void
        {
            var _local_2:FurnitureItem = this._Str_1636.getValue(k.id);
            if (_local_2 == null)
            {
                this._Str_1636.unshift(k.id, k);
            }
            else
            {
                _local_2.locked = false;
            }
            this._Str_10703();
        }

        public function pop():FurnitureItem
        {
            var k:FurnitureItem;
            if (this._Str_1636.length > 0)
            {
                k = (this._Str_1636.getWithIndex((this._Str_1636.length - 1)) as FurnitureItem);
                this._Str_1636.remove(k.id);
            }
            this._Str_10703();
            return k;
        }

        public function _Str_3205():FurnitureItem
        {
            var k:FurnitureItem;
            if (this._Str_1636.length > 0)
            {
                k = (this._Str_1636.getWithIndex((this._Str_1636.length - 1)) as FurnitureItem);
                this._Str_10703();
            }
            return k;
        }

        public function _Str_5087(k:int):FurnitureItem
        {
            return this._Str_1636.getWithIndex(k);
        }

        public function _Str_25861(k:int):Vector.<IFurnitureItem>
        {
            var _local_6:FurnitureItem;
            var _local_2:Vector.<IFurnitureItem> = new Vector.<IFurnitureItem>();
            var _local_3:IFurnitureItem = this._Str_21356();
            if (_local_3 == null)
            {
                return _local_2;
            }
            var _local_4:int;
            var _local_5:int;
            while (_local_5 < this._Str_1636.length)
            {
                if (_local_4 >= k)
                {
                    break;
                }
                _local_6 = this._Str_1636.getWithIndex(_local_5);
                if ((((!(_local_6.locked)) && (_local_6._Str_8386)) && (_local_6.type == _local_3.type)))
                {
                    _local_4++;
                    _local_2.push(_local_6);
                }
                _local_5++;
            }
            return _local_2;
        }

        public function _Str_21356():FurnitureItem
        {
            var _local_2:FurnitureItem;
            var _local_3:FurnitureItem;
            if (((this._Str_4881 >= 0) && (this._Str_4881 < this._Str_1636.length)))
            {
                _local_2 = this._Str_1636.getWithIndex(this._Str_4881);
                if (((!(_local_2.locked)) && (_local_2._Str_8386)))
                {
                    return _local_2;
                }
            }
            var k:int;
            while (k < this._Str_1636.length)
            {
                _local_3 = this._Str_1636.getWithIndex(k);
                if (((!(_local_3.locked)) && (_local_3._Str_8386)))
                {
                    return _local_3;
                }
                k++;
            }
            return null;
        }

        public function _Str_25739():FurnitureItem
        {
            var _local_2:FurnitureItem;
            var k:int;
            while (k < this._Str_1636.length)
            {
                _local_2 = this._Str_1636.getWithIndex(k);
                if (((!(_local_2.locked)) && (_local_2._Str_16260)))
                {
                    this._Str_15750(_local_2.id);
                    return _local_2;
                }
                k++;
            }
            return null;
        }

        public function _Str_25918():FurnitureItem
        {
            var _local_2:FurnitureItem;
            var k:int;
            while (k < this._Str_1636.length)
            {
                _local_2 = this._Str_1636.getWithIndex(k);
                if (((!(_local_2.locked)) && (_local_2.sellable)))
                {
                    return _local_2;
                }
                k++;
            }
            return null;
        }

        public function _Str_24519():Array
        {
            var _local_2:FurnitureItem;
            var k:Array = [];
            for each (_local_2 in this._Str_1636)
            {
                k.push(_local_2.id);
            }
            return k;
        }

        public function _Str_25304():Array
        {
            var _local_2:FurnitureItem;
            var k:Array = [];
            for each (_local_2 in this._Str_1636)
            {
                if (!_local_2.rentable)
                {
                    k.push(_local_2.id);
                }
            }
            return k;
        }

        public function _Str_15750(k:int):Boolean
        {
            var _local_3:FurnitureItem;
            var _local_2:int;
            while (_local_2 < this._Str_1636.length)
            {
                _local_3 = this._Str_1636.getWithIndex(_local_2);
                if (_local_3.id == k)
                {
                    _local_3.locked = true;
                    this._Str_7686();
                    return true;
                }
                _local_2++;
            }
            return false;
        }

        public function _Str_25603(k:Array):void
        {
            var _local_3:Boolean;
            var _local_4:FurnitureItem;
            var _local_5:Boolean;
            var _local_2:int = (this._Str_1636.length - 1);
            while (_local_2 >= 0)
            {
                _local_4 = this._Str_1636.getWithIndex(_local_2);
                _local_5 = (k.indexOf(_local_4.ref) >= 0);
                if (_local_4.locked != _local_5)
                {
                    _local_4.locked = _local_5;
                    _local_3 = true;
                }
                _local_2--;
            }
            if (_local_3)
            {
                this._Str_7686();
            }
        }

        public function _Str_10184(k:int):Boolean
        {
            var _local_3:FurnitureItem;
            var _local_2:int;
            while (_local_2 < this._Str_1636.length)
            {
                _local_3 = this._Str_1636.getWithIndex(_local_2);
                if (_local_3.id == k)
                {
                    _local_3.locked = false;
                    this._Str_7686();
                    this._Str_12824();
                    return true;
                }
                _local_2++;
            }
            return false;
        }

        public function _Str_12838():void
        {
            var k:Boolean;
            var _local_3:FurnitureItem;
            var _local_2:int = (this._Str_1636.length - 1);
            while (_local_2 >= 0)
            {
                _local_3 = this._Str_1636.getWithIndex(_local_2);
                if (_local_3.locked)
                {
                    _local_3.locked = false;
                    k = true;
                }
                _local_2--;
            }
            if (k)
            {
                this._Str_7686();
            }
        }

        public function getTotalCount():int
        {
            var k:int;
            var _local_2:int;
            var _local_3:FurnitureItem;
            if (this.category == FurniCategory._Str_12351)
            {
                k = 0;
                _local_2 = 0;
                while (_local_2 < this._Str_1636.length)
                {
                    _local_3 = (this._Str_1636.getWithIndex(_local_2) as FurnitureItem);
                    k = (k + int(_local_3.stuffData.getLegacyString()));
                    _local_2++;
                }
                return k;
            }
            return this._Str_1636.length;
        }

        public function _Str_22135():int
        {
            var _local_3:FurnitureItem;
            var k:int;
            var _local_2:int;
            while (_local_2 < this._Str_1636.length)
            {
                _local_3 = (this._Str_1636.getWithIndex(_local_2) as FurnitureItem);
                if (((_local_3._Str_16260) && (!(_local_3.locked))))
                {
                    k++;
                }
                _local_2++;
            }
            return k;
        }

        public function _Str_24914():int
        {
            var _local_3:FurnitureItem;
            var k:int;
            var _local_2:int;
            while (_local_2 < this._Str_1636.length)
            {
                _local_3 = (this._Str_1636.getWithIndex(_local_2) as FurnitureItem);
                if (((_local_3._Str_8386) && (!(_local_3.locked))))
                {
                    k++;
                }
                _local_2++;
            }
            return k;
        }

        public function remove(k:int):FurnitureItem
        {
            var _local_2:FurnitureItem = this._Str_1636.getValue(k);
            if (_local_2)
            {
                this._Str_1636.remove(k);
                this._Str_10703();
                return _local_2;
            }
            return null;
        }

        public function _Str_2990(k:int):FurnitureItem
        {
            var _local_2:FurnitureItem = this._Str_1636.getValue(k);
            return _local_2;
        }

        public function _Str_23685(k:int, _arg_2:FurnitureItem):void
        {
            this._Str_1636.add(k, _arg_2);
            this._Str_10703();
        }

        public function getMinimumItemsToShowCounter():int
        {
            return 2;
        }

        public function getUnlockedCount():int
        {
            var k:FurnitureItem;
            if (this.category == FurniCategory._Str_12351)
            {
                return this.getTotalCount();
            }
            var _local_2:int;
            var _local_3:int;
            while (_local_3 < this._Str_1636.length)
            {
                k = this._Str_1636.getWithIndex(_local_3);
                if (!k.locked)
                {
                    _local_2++;
                }
                _local_3++;
            }
            return _local_2;
        }

        public function _Str_10703():void
        {
            if (this._window == null)
            {
                return;
            }
            if (this._window.disposed)
            {
                return;
            }
            this._Str_11831();
            this._Str_13259();
            this._Str_7686();
            this._Str_12824();
            this._Str_8706();
            this._Str_25122();
        }

        public function imageReady(k:int, _arg_2:BitmapData):void
        {
            if (this._window == null)
            {
                return;
            }
            if (this._window.disposed)
            {
                return;
            }
            if (this._Str_7053 != k)
            {
                return;
            }
            this._Str_3155 = _arg_2;
            this._Str_11831();
        }

        public function imageFailed(k:int):void
        {
        }

        private function _Str_19507(k:BitmapData):void
        {
            this._Str_3155 = k;
            this._Str_10374 = true;
            this._Str_7053 = -1;
            this._Str_11831();
        }

        private function _Str_22544(k:BitmapData):void
        {
            this._Str_3155 = k;
            this._Str_10374 = true;
            this._Str_11831();
        }

        private function _Str_25122():void
        {
            if (((this._window == null) || (this._window.disposed)))
            {
                return;
            }
            var k:FurnitureItem = this._Str_5087(0);
            var _local_2:IStaticBitmapWrapperWindow = (this._window.findChildByName("rent_state") as IStaticBitmapWrapperWindow);
            if (((!(k)) || (!(this._Str_3459))))
            {
                _local_2.visible = false;
                return;
            }
            _local_2.visible = ((k.secondsToExpiration >= 0) && (k.hasRentPeriodStarted));
            var _local_3:int = this._Str_2307.controller.getInteger("purchase.rent.warning_duration_seconds", 172800);
            _local_2.assetUri = ((k.secondsToExpiration < _local_3) ? "inventory_thumb_rent_ending" : "inventory_thumb_rent_started");
        }

        private function _Str_7686():void
        {
            var _local_5:ITextWindow;
            if (!this._window)
            {
                return;
            }
            var k:int = this.getUnlockedCount();
            var _local_2:* = (k >= this.getMinimumItemsToShowCounter());
            var _local_3:IWindow = this._window.findChildByName("number_container");
            _local_3.visible = _local_2;
            if (_local_2)
            {
                _local_5 = (this._window.findChildByName("number") as ITextWindow);
                _local_5.text = String(k);
            }
            var _local_4:IBitmapWrapperWindow = (this._window.findChildByName("bitmap") as IBitmapWrapperWindow);
            if (k <= 0)
            {
                _local_4.blend = this._Str_18535;
            }
            else
            {
                _local_4.blend = this._Str_18094;
            }
        }

        private function _Str_13259():void
        {
            if (!this._window)
            {
                return;
            }
            if (!this._Str_2779)
            {
                this._Str_2779 = this._window.findChildByTag("BG_COLOR");
            }
            this._Str_2779.color = ((this._Str_8275) ? _Str_4169 : _Str_4072);
        }

        private function _Str_8706():void
        {
            if (!this._window)
            {
                return;
            }
            this._window.findChildByName("outline").visible = this._Str_2365;
        }

        private function _Str_12824():void
        {
            if (!this._window)
            {
                return;
            }
            var k:IWindow = this._window.findChildByName("recyclable_container");
            if (k)
            {
                k.visible = ((this._Str_14011) && (this._Str_22135() > 0));
            }
        }

        private function _Str_11831():void
        {
            var k:IWidgetWindow;
            var _local_2:_Str_3353;
            var _local_4:IWidgetWindow;
            var _local_5:_Str_3083;
            if (!this._window)
            {
                return;
            }
            if (this.stuffData.uniqueSerialNumber > 0)
            {
                k = IWidgetWindow(this._window.findChildByName("unique_item_overlay_container"));
                _local_2 = _Str_3353(k.widget);
                k.visible = true;
                _local_2._Str_3442 = this.stuffData.uniqueSerialNumber;
                _local_2.animated = true;
                this._window.findChildByName("unique_item_background_bitmap").visible = true;
            }
            else
            {
                if (this.stuffData.rarityLevel >= 0)
                {
                    _local_4 = IWidgetWindow(this._window.findChildByName("rarity_item_overlay_container"));
                    _local_5 = _Str_3083(_local_4.widget);
                    _local_5.rarityLevel = this.stuffData.rarityLevel;
                    _local_4.visible = true;
                }
            }
            var _local_3:IBitmapWrapperWindow = (this._window.findChildByName("bitmap") as IBitmapWrapperWindow);
            if (_local_3)
            {
                _local_3.bitmap = this._Str_3155;
            }
        }

        private function _Str_13002(k:WindowEvent, _arg_2:IWindow):void
        {
            var _local_3:Boolean;
            switch (k.type)
            {
                case WindowMouseEvent.UP:
                    this._Str_8894 = false;
                    this._Str_2307._Str_5298();
                    return;
                case WindowMouseEvent.DOWN:
                    this._Str_2307._Str_19669();
                    this._Str_2365 = true;
                    this._Str_8894 = true;
                    this._Str_2307._Str_2944();
                    this._Str_2307._Str_21498 = this;
                    return;
                case WindowMouseEvent.OUT:
                    if (((!(this._Str_8894)) || (this._Str_2307._Str_7553)))
                    {
                        return;
                    }
                    _local_3 = this._Str_2307._Str_5337(true);
                    if (_local_3)
                    {
                        this._Str_8894 = false;
                    }
                    return;
                case WindowMouseEvent.CLICK:
                    this._Str_8894 = false;
                    return;
                case WindowMouseEvent.DOUBLE_CLICK:
                    this._Str_2307._Str_25520();
                    this._Str_8894 = false;
                    return;
            }
        }

        private function _Str_22349():void
        {
            this.createWindow();
            if (this._icon != null)
            {
                this._Str_19507(this._icon);
            }
            else
            {
                if (!this._Str_19058)
                {
                    this._Str_20973();
                }
            }
            this._window.procedure = this._Str_13002;
            this._window.name = ((this._roomEngine.getFurnitureType(this.type) + ".") + this.category);
            if (((this.stuffData) && (!(this.stuffData.getLegacyString() == ""))))
            {
                this._window.name = (this._window.name + (".s" + this.stuffData));
            }
            if (!isNaN(this._Str_2794))
            {
                this._window.name = (this._window.name + (".e" + this._Str_2794));
            }
            this._Str_13259();
            this._Str_7686();
            this._Str_11831();
            this._Str_12824();
            this._Str_8706();
            this._Str_2367 = true;
        }

        protected function createWindow():void
        {
            this._window = this._Str_2307.createItemWindow(INVENTORY_THUMB_XML);
        }

        private function _Str_20913():String
        {
            var k:FurnitureItem;
            var _local_2:String;
            var _local_3:ISongInfo;
            k = this._Str_3205();
            if (k == null)
            {
                return "";
            }
            switch (this._category)
            {
                case FurniCategory._Str_5186:
                    _local_2 = (("poster_" + k.stuffData.getLegacyString()) + "_name");
                    break;
                case FurniCategory._Str_9125:
                    _local_3 = this._Str_2307._Str_2476._Str_2774._Str_3255(k._Str_2794);
                    if (_local_3 != null)
                    {
                        return _local_3.name;
                    }
                    this._Str_3255(k);
                    return "";
                default:
                    if (this._Str_2770)
                    {
                        _local_2 = ("wallItem.name." + k.type);
                    }
                    else
                    {
                        _local_2 = ("roomItem.name." + k.type);
                    }
            }
            return this._Str_2307.controller.localization.getLocalization(_local_2);
        }

        private function _Str_21119():String
        {
            var k:FurnitureItem;
            var _local_2:String;
            var _local_3:ISongInfo;
            k = this._Str_3205();
            if (k == null)
            {
                return "";
            }
            switch (this._category)
            {
                case FurniCategory._Str_5186:
                    _local_2 = (("poster_" + k.stuffData.getLegacyString()) + "_desc");
                    break;
                case FurniCategory._Str_9125:
                    _local_3 = this._Str_2307._Str_2476._Str_2774._Str_3255(k._Str_2794);
                    if (_local_3 != null)
                    {
                        return _local_3.creator;
                    }
                    this._Str_3255(k);
                    return "";
                default:
                    if (this._Str_2770)
                    {
                        _local_2 = ("wallItem.desc." + k.type);
                    }
                    else
                    {
                        _local_2 = ("roomItem.desc." + k.type);
                    }
            }
            return this._Str_2307.controller.localization.getLocalization(_local_2);
        }

        private function _Str_3255(k:FurnitureItem):void
        {
            var _local_2:int;
            var _local_3:ISongInfo;
            if (k == null)
            {
                return;
            }
            this._Str_14420 = -1;
            if (k != null)
            {
                if (k.category == FurniCategory._Str_9125)
                {
                    _local_2 = k._Str_2794;
                    _local_3 = this._Str_2307._Str_2476._Str_2774._Str_3255(_local_2);
                    if (_local_3 == null)
                    {
                        this._Str_2307._Str_2476._Str_2774._Str_7732(_local_2);
                        this._Str_14420 = _local_2;
                    }
                }
            }
        }

        private function _Str_3530(k:SongInfoReceivedEvent):void
        {
            if (k.id == this._Str_14420)
            {
                this._Str_14420 = -1;
                this._name = this._Str_20913();
                this._description = this._Str_21119();
                if (this._Str_2307._Str_3968() == this)
                {
                    this._Str_2307._Str_2944();
                }
            }
        }

        public function get _Str_4405():int
        {
            return this._Str_4881;
        }

        public function set _Str_4405(k:int):void
        {
            if (k >= this._Str_1636.length)
            {
                k = 0;
            }
            this._Str_4881 = k;
        }
    }
}
