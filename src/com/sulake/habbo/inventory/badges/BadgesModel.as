package com.sulake.habbo.inventory.badges
{
    import com.sulake.habbo.inventory.IInventoryModel;
    import com.sulake.habbo.inventory.HabboInventory;
    import com.sulake.core.utils.Map;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.habbo.communication.IHabboCommunicationManager;
    import com.sulake.habbo.window.IHabboWindowManager;
    import com.sulake.habbo.communication.messages.outgoing.inventory.badges._Str_7891;
    import com.sulake.core.assets.IAsset;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.habbo.inventory.enum.UnseenItemCategoryEnum;
    import com.sulake.habbo.communication.messages.outgoing.inventory.badges.SetActivatedBadgesComposer;
    import com.sulake.habbo.inventory.enum.InventoryCategory;
    import flash.events.Event;
    import com.sulake.habbo.inventory.events.HabboInventoryTrackingEvent;

    public class BadgesModel implements IInventoryModel 
    {
        public static const _Str_16949:int = -1;
        public static const _Str_8369:int = 0;
        public static const _Str_6557:int = 1;

        private const _Str_23733:int = 5;

        private var _controller:HabboInventory;
        private var _view:BadgesView;
        private var _badges:Array;
        private var _badgesInUse:Array;
        private var _badgeIds:Map;
        private var _assets:IAssetLibrary;
        private var _communication:IHabboCommunicationManager;
        private var _windowManager:IHabboWindowManager;
        private var _disposed:Boolean = false;

        public function BadgesModel(k:HabboInventory, _arg_2:IHabboWindowManager, _arg_3:IHabboCommunicationManager, _arg_4:IAssetLibrary)
        {
            this._controller = k;
            this._windowManager = _arg_2;
            this._badges = new Array();
            this._badgesInUse = new Array();
            this._assets = _arg_4;
            this._communication = _arg_3;
            this._view = new BadgesView(this, _arg_2, _arg_4);
            this._badgeIds = new Map();
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }

        public function dispose():void
        {
            if (this._disposed)
            {
                return;
            }
            this._disposed = true;
            this._controller = null;
            this._windowManager = null;
            this._badges = null;
            this._badgesInUse = null;
            if (this._badgeIds)
            {
                this._badgeIds.dispose();
                this._badgeIds = null;
            }
            if (this._view != null)
            {
                this._view.dispose();
                this._view = null;
            }
            this._assets = null;
            this._communication = null;
        }

        public function _Str_4889():void
        {
            this._communication.connection.send(new _Str_7891());
        }

        public function _Str_23348():int
        {
            return this._Str_23733;
        }

        public function _Str_2491():void
        {
            if (this._view != null)
            {
                this._view._Str_18918(null);
            }
        }

        private function _Str_2944():void
        {
            if (this._view != null)
            {
                this._view._Str_2944();
            }
        }

        private function _Str_17363(k:Badge):void
        {
            this._badgesInUse.push(k);
            k._Str_3222 = true;
        }

        private function _Str_16521(k:Badge):void
        {
            var _local_2:int;
            while (_local_2 < this._badgesInUse.length)
            {
                if (this._badgesInUse[_local_2] == k)
                {
                    this._badgesInUse.splice(_local_2, 1);
                    k._Str_3222 = false;
                    return;
                }
                _local_2++;
            }
        }

        public function updateBadge(k:String, _arg_2:Boolean, _arg_3:int=0):void
        {
            var _local_5:IAsset;
            var _local_6:XmlAsset;
            var _local_7:IWindowContainer;
            var _local_8:Boolean;
            var _local_9:Badge;
            if (_arg_3 > 0)
            {
                this._badgeIds.add(k, _arg_3);
            }
            var _local_4:Badge = this._Str_19103(k);
            if (_local_4 != null)
            {
                if (_local_4._Str_3222 != _arg_2)
                {
                    if (_arg_2)
                    {
                        this._Str_17363(_local_4);
                    }
                    else
                    {
                        this._Str_16521(_local_4);
                    }
                }
            }
            else
            {
                _local_5 = this._assets.getAssetByName("inventory_thumb_xml");
                _local_6 = XmlAsset(_local_5);
                _local_7 = (this._windowManager.buildFromXML(XML(_local_6.content)) as IWindowContainer);
                _local_8 = this._controller._Str_3455._Str_3613(UnseenItemCategoryEnum.BADGE, _arg_3);
                _local_9 = new Badge(k, _local_7, _local_8);
                if (_local_8)
                {
                    this._badges.unshift(_local_9);
                }
                else
                {
                    this._badges.push(_local_9);
                }
                if (_arg_2)
                {
                    this._Str_17363(_local_9);
                }
            }
        }

        private function _Str_19103(k:String):Badge
        {
            var _local_3:Badge;
            var _local_2:int;
            while (_local_2 < this._badges.length)
            {
                _local_3 = this._badges[_local_2];
                if (_local_3.badgeId == k)
                {
                    return _local_3;
                }
                _local_2++;
            }
            return null;
        }

        public function _Str_24079(k:String):void
        {
            var _local_3:Badge;
            var _local_2:int;
            while (_local_2 < this._badges.length)
            {
                _local_3 = this._badges[_local_2];
                if (_local_3.badgeId == k)
                {
                    this._badges.splice(_local_2, 1);
                    this._Str_16521(_local_3);
                    this._Str_2491();
                    return;
                }
                _local_2++;
            }
        }

        public function _Str_24883(k:String):void
        {
            var _local_2:Badge = this._Str_19103(k);
            if (_local_2 != null)
            {
                if (_local_2._Str_3222)
                {
                    this._Str_16521(_local_2);
                }
                else
                {
                    this._Str_17363(_local_2);
                }
                this._Str_23795();
            }
        }

        public function _Str_23795():void
        {
            var _local_4:Badge;
            var k:SetActivatedBadgesComposer = new SetActivatedBadgesComposer();
            var _local_2:Array = this._Str_5453(_Str_6557);
            var _local_3:int;
            while (_local_3 < _local_2.length)
            {
                _local_4 = _local_2[_local_3];
                k.addActivatedBadge(_local_4.badgeId);
                _local_3++;
            }
            this._communication.connection.send(k);
        }

        public function _Str_17509(k:String):void
        {
            var _local_3:Badge;
            var _local_2:int;
            while (_local_2 < this._badges.length)
            {
                _local_3 = (this._badges[_local_2] as Badge);
                if (_local_3 != null)
                {
                    _local_3._Str_2365 = (_local_3.badgeId == k);
                }
                _local_2++;
            }
            this._Str_2944();
        }

        public function _Str_22395():void
        {
            var k:Badge = this._Str_17378();
            if (k != null)
            {
                return;
            }
            var _local_2:Array = this._Str_5453(_Str_8369);
            if (((!(_local_2 == null)) && (_local_2.length > 0)))
            {
                k = (_local_2[0] as Badge);
                k._Str_2365 = true;
                this._Str_2491();
                return;
            }
            var _local_3:Array = this._Str_5453(_Str_6557);
            if (((!(_local_3 == null)) && (_local_3.length > 0)))
            {
                k = (_local_3[0] as Badge);
                k._Str_2365 = true;
                this._Str_2491();
            }
        }

        public function _Str_17378(k:int=-1):Badge
        {
            var _local_4:Badge;
            var _local_2:Array = this._Str_5453(k);
            var _local_3:int;
            while (_local_3 < _local_2.length)
            {
                _local_4 = _local_2[_local_3];
                if (_local_4._Str_2365)
                {
                    return _local_4;
                }
                _local_3++;
            }
            return null;
        }

        public function _Str_5453(k:int=-1):Array
        {
            var _local_2:Array;
            var _local_3:Badge;
            switch (k)
            {
                case _Str_16949:
                    return this._badges;
                case _Str_8369:
                    _local_2 = new Array();
                    for each (_local_3 in this._badges)
                    {
                        if (!_local_3._Str_3222)
                        {
                            _local_2.push(_local_3);
                        }
                    }
                    return _local_2;
                case _Str_6557:
                    return this._badgesInUse;
            }
            Logger.log("Unexpected filter. Returning an empty array to maintain backward compatibility");
            return new Array();
        }

        public function _Str_24207(k:int):Badge
        {
            return this._Str_11080(k, _Str_6557);
        }

        public function _Str_26333(k:int):Badge
        {
            return this._Str_11080(k, _Str_8369);
        }

        public function _Str_11080(k:int, _arg_2:int=-1):Badge
        {
            var _local_3:Array = this._Str_5453(_arg_2);
            if (((k < 0) || (k >= _local_3.length)))
            {
                return null;
            }
            return _local_3[k];
        }

        public function getWindowContainer():IWindowContainer
        {
            return this._view.getWindowContainer();
        }

        public function _Str_5100():void
        {
            if (this._view.isVisible)
            {
                this._Str_4409();
            }
        }

        public function _Str_5913(k:String):void
        {
            if (((k == InventoryCategory.BADGES) && (this._controller.isVisible)))
            {
                this._controller.events.dispatchEvent(new Event(HabboInventoryTrackingEvent.HABBO_INVENTORY_TRACKING_EVENT_BADGES));
            }
        }

        public function _Str_5813(k:String):void
        {
        }

        public function get controller():HabboInventory
        {
            return this._controller;
        }

        public function _Str_4409():void
        {
            var k:Badge;
            if (!this._controller._Str_23029)
            {
                return;
            }
            this._controller._Str_3455._Str_8813(UnseenItemCategoryEnum.BADGE);
            for each (k in this._badges)
            {
                k._Str_3613 = false;
            }
            this._Str_2491();
            this._controller._Str_6956();
        }

        public function _Str_5725(k:String):void
        {
            this._Str_17509(k);
        }
    }
}
