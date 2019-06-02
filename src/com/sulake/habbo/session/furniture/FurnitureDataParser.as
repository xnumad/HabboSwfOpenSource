package com.sulake.habbo.session.furniture
{
    import com.sulake.core.runtime.events.EventDispatcherWrapper;
    import com.sulake.core.utils.Map;
    import com.sulake.core.localization.ICoreLocalizationManager;
    import com.sulake.core.assets.AssetLibrary;
    import flash.net.URLRequest;
    import com.sulake.core.assets.AssetLoaderStruct;
    import com.sulake.core.assets.loaders.AssetLoaderEvent;
    import com.sulake.core.Core;
    import flash.events.Event;
    import com.sulake.habbo.utils.HabboWebTools;

    public class FurnitureDataParser extends EventDispatcherWrapper 
    {
        public static const FDP_FURNITURE_DATA_READY:String = "FDP_furniture_data_ready";

        private var _floorItems:Map;
        private var _wallItems:Map;
        private var _itemIds:Map;
        private var _localization:ICoreLocalizationManager;
        private var _assetLib:AssetLibrary;

        public function FurnitureDataParser(k:Map, _arg_2:Map, _arg_3:Map, _arg_4:ICoreLocalizationManager)
        {
            this._floorItems = k;
            this._wallItems = _arg_2;
            this._itemIds = _arg_3;
            this._localization = _arg_4;
            this._assetLib = new AssetLibrary("FurniDataParserAssetLib");
        }

        override public function dispose():void
        {
            super.dispose();
            if (this._assetLib)
            {
                this._assetLib.dispose();
                this._assetLib = null;
            }
            this._localization = null;
            this._floorItems = null;
            this._wallItems = null;
            this._itemIds = null;
        }

        public function loadData(k:String):void
        {
            var _local_2:AssetLoaderStruct = this._assetLib.loadAssetFromFile(k, new URLRequest(k), "text/plain");
            _local_2.addEventListener(AssetLoaderEvent.ASSETLOADEREVENTCOMPLETE, this.parseFurnitureData);
            _local_2.addEventListener(AssetLoaderEvent.ASSETLOADEREVENTERROR, this.furnitureDataError);
        }

        private function parseFurnitureData(k:AssetLoaderEvent):void
        {
            var _local_2:AssetLoaderStruct = (k.target as AssetLoaderStruct);
            if (_local_2 == null)
            {
                return;
            }
            if (((_local_2.assetLoader == null) || (_local_2.assetLoader.content == null)))
            {
                return;
            }
            var _local_3:String = (_local_2.assetLoader.content as String);
            if (_local_3.charAt(0) == "<")
            {
                this._Str_17161(_local_3);
            }
            else
            {
                this._Str_18569(_local_3);
            }
        }

        private function _Str_17161(data:String):void
        {
            var categoryTypes:XMLList;
            var itemXml:XML;
            var furniData:FurnitureData;
            var xmlData:XML;
            try
            {
                xmlData = new XML(data);
            }
            catch(e:Error)
            {
                Core.error(("XML furni data was malformed: " + data), true, Core.ERROR_CATEGORY_FURNIDATA_DOWNLOAD);
            }
            if (xmlData == null)
            {
                return;
            }
            categoryTypes = xmlData.roomitemtypes;
            for each (itemXml in categoryTypes.furnitype)
            {
                furniData = this.parseFloorItem(itemXml);
                this.storeItem(furniData);
                this.registerFurnitureLocalization(furniData);
            }
            categoryTypes = xmlData.wallitemtypes;
            for each (itemXml in categoryTypes.furnitype)
            {
                furniData = this.parseWallItem(itemXml);
                this.storeItem(furniData);
                this.registerFurnitureLocalization(furniData);
            }
            dispatchEvent(new Event(FDP_FURNITURE_DATA_READY));
        }

        private function parseFloorItem(k:XML):FurnitureData
        {
            var _local_4:XML;
            var _local_5:String;
            var _local_6:Array;
            var _local_7:String;
            var _local_8:int;
            var _local_11:String;
            var _local_2:int = parseInt(k.@id);
            var _local_3:Array = new Array();
            for each (_local_4 in k.partcolors.color)
            {
                _local_11 = _local_4;
                if (_local_11.charAt(0) == "#")
                {
                    _local_11 = _local_11.replace("#", "");
                    _local_3.push(parseInt(_local_11, 16));
                }
                else
                {
                    _local_3.push(-(parseInt(_local_11)));
                }
            }
            _local_5 = k.@classname;
            _local_6 = _local_5.split("*");
            _local_7 = _local_6[0];
            _local_8 = ((_local_6.length > 1) ? parseInt(_local_6[1]) : 0);
            var _local_9:* = (_local_6.length > 1);
            var _local_10:FurnitureData = new FurnitureData(FurnitureData.S, _local_2, _local_5, _local_7, k.name, k.description, k.revision, k.xdim, k.ydim, 0, _local_3, _local_9, _local_8, k.adurl, k.offerid, (k.buyout == "1"), k.rentofferid, (k.rentbuyout == "1"), (k.bc == "1"), k.customparams, k.specialtype, (k.canstandon == "1"), (k.cansiton == "1"), (k.canlayon == "1"), (k.excludeddynamic == "1"), k.furniline);
            return _local_10;
        }

        private function parseWallItem(k:XML):FurnitureData
        {
            var _local_2:int = parseInt(k.@id);
            var _local_3:FurnitureData = new FurnitureData(FurnitureData.I, _local_2, k.@classname, k.@classname, k.name, k.description, k.revision, 0, 0, 0, null, false, 0, k.adurl, k.offerid, (k.buyout == "1"), k.rentofferid, (k.rentbuyout == "1"), (k.bc == "1"), null, k.specialtype, false, false, false, (k.excludeddynamic == "1"), k.furniline);
            return _local_3;
        }

        private function _Str_18569(k:String):void
        {
            var _local_7:String;
            var _local_8:Array;
            var _local_9:String;
            var _local_10:Array;
            var _local_11:String;
            var _local_12:int;
            var _local_13:String;
            var _local_14:Array;
            var _local_15:String;
            var _local_16:int;
            var _local_17:Boolean;
            var _local_18:int;
            var _local_19:int;
            var _local_20:int;
            var _local_21:int;
            var _local_22:Array;
            var _local_23:Array;
            var _local_24:int;
            var _local_25:String;
            var _local_26:String;
            var _local_27:String;
            var _local_28:int;
            var _local_29:Boolean;
            var _local_30:int;
            var _local_31:Boolean;
            var _local_32:String;
            var _local_33:int;
            var _local_34:Boolean;
            var _local_35:Boolean;
            var _local_36:Boolean;
            var _local_37:Boolean;
            var _local_38:Boolean;
            var _local_39:Boolean;
            var _local_40:FurnitureData;
            var _local_41:String;
            var _local_2:RegExp = /\n\r{1,}|\n{1,}|\r{1,}/mg;
            var _local_3:RegExp = /^\s+|\s+$/g;
            var _local_4:RegExp = /\[+?((.)*?)\]/g;
            var _local_5:Array = k.split(_local_2);
            var _local_6:int;
            for each (_local_7 in _local_5)
            {
                _local_8 = _local_7.match(_local_4);
                for each (_local_9 in _local_8)
                {
                    _local_9 = _local_9.replace(/\[{1,}/mg, "");
                    _local_9 = _local_9.replace(/\]{1,}/mg, "");
                    _local_10 = _local_9.split('"');
                    this.removePatternFrom(_local_10, ", ");
                    this.removePatternFrom(_local_10, ",");
                    _local_10.splice(0, 1);
                    _local_10.splice((_local_10.length - 1), 1);
                    if (_local_10.length < 18)
                    {
                        Core.error(("Lingo furni data was malformed: " + k), true, Core.ERROR_CATEGORY_FURNIDATA_DOWNLOAD);
                        return;
                    }
                    _local_11 = _local_10[0];
                    _local_12 = parseInt(_local_10[1]);
                    _local_13 = String(_local_10[2]);
                    _local_14 = _local_13.split("*");
                    _local_15 = _local_14[0];
                    _local_16 = ((_local_14.length > 1) ? parseInt(_local_14[1]) : 0);
                    _local_17 = (_local_14.length > 1);
                    _local_18 = parseInt(_local_10[3]);
                    _local_19 = parseInt(_local_10[4]);
                    _local_20 = parseInt(_local_10[5]);
                    _local_21 = parseInt(_local_10[6]);
                    _local_22 = [];
                    _local_23 = _local_10[7].split(",");
                    _local_24 = 0;
                    while (_local_24 < _local_23.length)
                    {
                        _local_41 = _local_23[_local_24];
                        if (_local_41.charAt(0) == "#")
                        {
                            _local_41 = _local_41.replace("#", "");
                            _local_22.push(parseInt(_local_41, 16));
                        }
                        else
                        {
                            _local_22.push(-(parseInt(_local_41)));
                        }
                        _local_24++;
                    }
                    _local_25 = _local_10[8];
                    _local_26 = _local_10[9];
                    _local_27 = _local_10[10];
                    _local_28 = parseInt(_local_10[11]);
                    _local_29 = (_local_10[12] == "true");
                    _local_30 = parseInt(_local_10[13]);
                    _local_31 = (_local_10[14] == "true");
                    _local_32 = _local_10[15];
                    _local_33 = parseInt(_local_10[16]);
                    _local_34 = (_local_10[17] == "true");
                    _local_38 = false;
                    _local_39 = (_local_11 == "i");
                    if (_local_39)
                    {
                        _local_35 = false;
                        _local_36 = false;
                        _local_37 = false;
                        if (_local_10.length >= 19)
                        {
                            _local_38 = (_local_10[18] == "1");
                        }
                    }
                    else
                    {
                        _local_35 = (_local_10[18] == "1");
                        _local_36 = (_local_10[19] == "1");
                        _local_37 = (_local_10[20] == "1");
                        if (_local_10.length >= 22)
                        {
                            _local_38 = (_local_10[21] == "1");
                        }
                    }
                    _local_40 = new FurnitureData(_local_11, _local_12, _local_13, _local_15, _local_25, _local_26, _local_18, _local_19, _local_20, _local_21, _local_22, _local_17, _local_16, _local_27, _local_28, _local_29, _local_30, _local_31, _local_34, _local_32, _local_33, _local_35, _local_36, _local_37, _local_38, "");
                    this.storeItem(_local_40);
                    this.registerFurnitureLocalization(_local_40);
                }
                _local_6++;
            }
            dispatchEvent(new Event(FDP_FURNITURE_DATA_READY));
        }

        private function storeItem(k:FurnitureData):void
        {
            if (k.type == FurnitureData.S)
            {
                this._floorItems.add(k.id, k);
            }
            else if (k.type == FurnitureData.I)
            {
                this._wallItems.add(k.id, k);
            }
            var _local_2:Array = this._itemIds[k.className];
            if (_local_2 == null)
            {
                _local_2 = [];
                this._itemIds.add(k.className, _local_2);
            }
            _local_2[k.colourIndex] = k.id;
        }

        private function furnitureDataError(k:AssetLoaderEvent):void
        {
            HabboWebTools.logEventLog(("furnituredata download error " + k.status));
            Core.error("Could not download furnidata definition", true, Core.ERROR_CATEGORY_FURNIDATA_DOWNLOAD);
        }

        private function registerFurnitureLocalization(k:FurnitureData):void
        {
            if (this._localization != null)
            {
                if (k.type == FurnitureData.S)
                {
                    this._localization.updateLocalization(("roomItem.name." + k.id), k.localizedName);
                    this._localization.updateLocalization(("roomItem.desc." + k.id), k.description);
                }
                else
                {
                    if (k.type == FurnitureData.I)
                    {
                        this._localization.updateLocalization(("wallItem.name." + k.id), k.localizedName);
                        this._localization.updateLocalization(("wallItem.desc." + k.id), k.description);
                    }
                }
            }
        }

        private function removePatternFrom(k:Array, _arg_2:Object):void
        {
            var _local_3:int;
            while (_local_3 < k.length)
            {
                if (k[_local_3] == _arg_2)
                {
                    k.splice(_local_3, 1);
                    _local_3--;
                }
                _local_3++;
            }
        }
    }
}
