package com.sulake.habbo.inventory.effects
{
    import com.sulake.habbo.inventory.IInventoryModel;
    import com.sulake.habbo.inventory.HabboInventory;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.habbo.communication.IHabboCommunicationManager;
    import com.sulake.habbo.window.IHabboWindowManager;
    import com.sulake.habbo.localization.IHabboLocalizationManager;
    import com.sulake.core.assets.BitmapDataAsset;
    import flash.display.BitmapData;
    import com.sulake.habbo.communication.messages.outgoing._Str_94._Str_11266;
    import com.sulake.habbo.communication.messages.outgoing._Str_94._Str_5945;
    import com.sulake.habbo.inventory.IAvatarEffect;
    import com.sulake.core.window.IWindowContainer;

    public class EffectsModel implements IInventoryModel 
    {
        public static const _Str_18210:int = -1;
        public static const _Str_16011:int = 0;
        public static const _Str_14844:int = 1;

        private var _controller:HabboInventory;
        private var _view:EffectsView;
        private var _effects:Array;
        private var _assets:IAssetLibrary;
        private var _communication:IHabboCommunicationManager;
        private var _activeEffectsProxy:EffectListProxy;
        private var _inactiveEffectsProxy:EffectListProxy;
        private var _disposed:Boolean = false;
        private var _lastActivatedEffect:int = -1;

        public function EffectsModel(k:HabboInventory, _arg_2:IHabboWindowManager, _arg_3:IHabboCommunicationManager, _arg_4:IAssetLibrary, _arg_5:IHabboLocalizationManager)
        {
            this._controller = k;
            this._effects = new Array();
            this._assets = _arg_4;
            this._communication = _arg_3;
            this._activeEffectsProxy = new EffectListProxy(this, 1);
            this._inactiveEffectsProxy = new EffectListProxy(this, 0);
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }

        public function get _Str_24332():int
        {
            return this._lastActivatedEffect;
        }

        public function dispose():void
        {
            if (!this._disposed)
            {
                this._controller = null;
                if (this._view != null)
                {
                    this._view.dispose();
                }
                if (this._activeEffectsProxy != null)
                {
                    this._activeEffectsProxy.dispose();
                    this._activeEffectsProxy = null;
                }
                if (this._inactiveEffectsProxy != null)
                {
                    this._inactiveEffectsProxy.dispose();
                    this._inactiveEffectsProxy = null;
                }
                this._disposed = true;
            }
        }

        public function _Str_4889():void
        {
        }

        public function _Str_5913(k:String):void
        {
        }

        public function _Str_2428(k:Effect, _arg_2:Boolean=true):void
        {
            var _local_4:BitmapDataAsset;
            var _local_3:Effect = this._Str_5810(k.type);
            if (_local_3 != null)
            {
                _local_3._Str_4225++;
            }
            else
            {
                _local_4 = BitmapDataAsset(this._assets.getAssetByName((("fx_icon_" + k.type) + "_png")));
                if (_local_4 != null)
                {
                    k._Str_3093 = BitmapData(_local_4.content);
                }
                this._effects.push(k);
            }
            if (_arg_2)
            {
                this._Str_4879();
            }
        }

        private function _Str_5810(k:int):Effect
        {
            var _local_3:Effect;
            var _local_2:int;
            while (_local_2 < this._effects.length)
            {
                _local_3 = this._effects[_local_2];
                if (_local_3.type == k)
                {
                    return _local_3;
                }
                _local_2++;
            }
            return null;
        }

        private function _Str_23376(k:int):void
        {
            var _local_3:Effect;
            var _local_2:int;
            while (_local_2 < this._effects.length)
            {
                _local_3 = this._effects[_local_2];
                if (_local_3.type == k)
                {
                    this._effects.splice(_local_2, 1);
                    this._Str_4879();
                    return;
                }
                _local_2++;
            }
        }

        public function _Str_4879():void
        {
            if (this._view)
            {
                this._view._Str_13242();
                this._view._Str_2944();
            }
        }

        public function _Str_19434(k:int):void
        {
            this._controller.communication.connection.send(new _Str_11266(k));
        }

        public function _Str_22417(k:int):void
        {
            var _local_2:Effect = this._Str_5810(k);
            if (_local_2 != null)
            {
                this._Str_17044(false, false);
                _local_2.isActive = true;
                _local_2._Str_3222 = true;
                this._Str_4879();
            }
        }

        public function _Str_20338(k:int):void
        {
            this._Str_17044(false, false, true);
            var _local_2:Effect = this._Str_5810(k);
            if (_local_2 == null)
            {
                return;
            }
            if (!_local_2.isActive)
            {
                this._Str_19434(_local_2.type);
            }
            if (_local_2._Str_3222 == false)
            {
                _local_2._Str_3222 = true;
                this._controller.communication.connection.send(new _Str_5945(k));
                this._lastActivatedEffect = k;
                this._Str_4879();
            }
        }

        public function _Str_22531(k:int, _arg_2:Boolean=false):void
        {
            var _local_3:Effect = this._Str_5810(k);
            if (_local_3 != null)
            {
                if (_local_3._Str_3222 == true)
                {
                    _local_3._Str_3222 = false;
                    if (_arg_2)
                    {
                        this._controller.communication.connection.send(new _Str_5945(-1));
                        this._lastActivatedEffect = -1;
                    }
                    this._Str_4879();
                }
            }
        }

        public function _Str_17044(k:Boolean=true, _arg_2:Boolean=true, _arg_3:Boolean=false):void
        {
            var _local_5:Effect;
            var _local_4:int;
            while (_local_4 < this._effects.length)
            {
                _local_5 = this._effects[_local_4];
                _local_5._Str_3222 = false;
                _local_4++;
            }
            if (k)
            {
                this._controller.communication.connection.send(new _Str_5945(-1));
            }
            if (_arg_2)
            {
                this._Str_4879();
            }
            if (_arg_3)
            {
                this._lastActivatedEffect = -1;
            }
        }

        public function _Str_19804(k:int):void
        {
            var _local_2:Effect = this._Str_5810(k);
            if (_local_2 != null)
            {
                if (_local_2._Str_2365)
                {
                    this.setEffectDeselected(k);
                }
                else
                {
                    this.setEffectSelected(k);
                }
                this._Str_4879();
            }
        }

        public function _Str_23964(k:int):IAvatarEffect
        {
            return this._Str_5810(k) as IAvatarEffect;
        }

        public function setEffectSelected(k:int):void
        {
            var _local_2:Effect = this._Str_5810(k);
            if (_local_2 != null)
            {
                this._Str_22710(false);
                _local_2._Str_2365 = true;
                this._Str_4879();
            }
        }

        public function setEffectDeselected(k:int):void
        {
            var _local_2:Effect = this._Str_5810(k);
            if (_local_2 != null)
            {
                _local_2._Str_2365 = false;
                this._Str_4879();
            }
        }

        private function _Str_22710(k:Boolean=true):void
        {
            var _local_3:Effect;
            var _local_2:int;
            while (_local_2 < this._effects.length)
            {
                _local_3 = this._effects[_local_2];
                _local_3._Str_2365 = false;
                _local_2++;
            }
            if (k)
            {
                this._Str_4879();
            }
        }

        public function _Str_21540(k:int=-1):Effect
        {
            var _local_4:Effect;
            var _local_2:Array = this._Str_6532(k);
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

        public function _Str_6532(k:int=-1):Array
        {
            var _local_4:Effect;
            var _local_2:Array = [];
            var _local_3:int;
            while (_local_3 < this._effects.length)
            {
                _local_4 = this._effects[_local_3];
                if (((((_local_4.isActive) && (k == _Str_14844)) || ((!(_local_4.isActive)) && (k == _Str_16011))) || (k == _Str_18210)))
                {
                    _local_2.push(_local_4);
                }
                _local_3++;
            }
            return _local_2;
        }

        public function _Str_24134(k:int):void
        {
            this._lastActivatedEffect = -1;
            var _local_2:Effect = this._Str_5810(k);
            if (_local_2 != null)
            {
                if (_local_2._Str_4225 > 1)
                {
                    _local_2._Str_24370();
                    this._Str_4879();
                }
                else
                {
                    this._Str_23376(_local_2.type);
                }
            }
        }

        public function _Str_11080(k:int, _arg_2:int=-1):Effect
        {
            var _local_3:Array = this._Str_6532(_arg_2);
            if (((k < 0) || (k >= _local_3.length)))
            {
                return null;
            }
            var _local_4:Effect = _local_3[k];
            return _local_4;
        }

        public function getWindowContainer():IWindowContainer
        {
            return (this._view) ? this._view.getWindowContainer() : null;
        }

        public function _Str_5100():void
        {
        }

        public function _Str_5813(k:String):void
        {
        }

        public function _Str_24964():void
        {
            if (this._lastActivatedEffect != -1)
            {
                this._Str_20338(this._lastActivatedEffect);
            }
        }

        public function _Str_2491():void
        {
            if (((this._view) && (!(this._view.disposed))))
            {
                this._view._Str_13242();
                this._view._Str_2944();
            }
        }

        public function _Str_5725(k:String):void
        {
            this.setEffectSelected(int(k));
        }
    }
}
