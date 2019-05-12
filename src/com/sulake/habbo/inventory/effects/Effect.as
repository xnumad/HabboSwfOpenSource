package com.sulake.habbo.inventory.effects
{
    import com.sulake.habbo.ui.widget.memenu.IWidgetAvatarEffect;
    import com.sulake.habbo.inventory.IThumbListDrawableItem;
    import com.sulake.habbo.avatar.IHabboAvatarEditorAvatarEffect;
    import com.sulake.habbo.inventory.IAvatarEffect;
    import flash.display.BitmapData;

    public class Effect implements IWidgetAvatarEffect, IThumbListDrawableItem, IHabboAvatarEditorAvatarEffect, IAvatarEffect 
    {
        private var _type:int;
        private var _subType:int;
        private var _duration:int;
        private var _effectsInInventory:int = 1;
        private var _secondsLeftStamped:int;
        private var _permanent:Boolean = false;
        private var _isActive:Boolean = false;
        private var _isSelected:Boolean = false;
        private var _isInUse:Boolean = false;
        private var _iconImage:BitmapData;
        private var _activatedTimeStamp:Date;


        public function get type():int
        {
            return this._type;
        }

        public function get _Str_3882():int
        {
            return this._subType;
        }

        public function get duration():int
        {
            return this._duration;
        }

        public function get _Str_4225():int
        {
            return this._effectsInInventory;
        }

        public function get _Str_4010():Boolean
        {
            return this._permanent;
        }

        public function get isActive():Boolean
        {
            return this._isActive;
        }

        public function get _Str_3222():Boolean
        {
            return this._isInUse;
        }

        public function get _Str_2365():Boolean
        {
            return this._isSelected;
        }

        public function get icon():BitmapData
        {
            return this._iconImage;
        }

        public function get _Str_3093():BitmapData
        {
            return this._iconImage;
        }

        public function get _Str_3709():int
        {
            var k:int;
            if (this._isActive)
            {
                k = (this._secondsLeftStamped - ((new Date().valueOf() - this._activatedTimeStamp.valueOf()) / 1000));
                k = Math.floor(k);
                if (k < 0)
                {
                    k = 0;
                }
                return k;
            }
            return this._secondsLeftStamped;
        }

        public function set type(k:int):void
        {
            this._type = k;
        }

        public function set _Str_3882(k:int):void
        {
            this._subType = k;
        }

        public function set duration(k:int):void
        {
            this._duration = k;
        }

        public function set _Str_3709(k:int):void
        {
            this._secondsLeftStamped = k;
        }

        public function set _Str_4010(k:Boolean):void
        {
            this._permanent = k;
        }

        public function set _Str_2365(k:Boolean):void
        {
            this._isSelected = k;
        }

        public function set _Str_3222(k:Boolean):void
        {
            this._isInUse = k;
        }

        public function set _Str_3093(k:BitmapData):void
        {
            this._iconImage = k;
        }

        public function set _Str_4225(k:int):void
        {
            this._effectsInInventory = k;
        }

        public function set isActive(k:Boolean):void
        {
            if (((k) && (!(this._isActive))))
            {
                this._activatedTimeStamp = new Date();
            }
            this._isActive = k;
        }

        public function _Str_24370():void
        {
            this._effectsInInventory--;
            if (this._effectsInInventory < 0)
            {
                this._effectsInInventory = 0;
            }
            this._secondsLeftStamped = this._duration;
            this._isActive = false;
            this._isInUse = false;
        }
    }
}
