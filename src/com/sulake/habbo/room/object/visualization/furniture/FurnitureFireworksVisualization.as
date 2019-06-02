package com.sulake.habbo.room.object.visualization.furniture
{
    import flash.utils.Dictionary;
    import com.sulake.room.object.IRoomObject;
    import com.sulake.room.object.IRoomObjectModel;
    import com.sulake.habbo.room.object.RoomObjectVariableEnum;

    public class FurnitureFireworksVisualization extends FurnitureAnimatedVisualization 
    {
        private var _particleSystems:Dictionary;
        private var _currentParticleSystem:FurnitureParticleSystem;


        override public function dispose():void
        {
            var k:FurnitureParticleSystem;
            super.dispose();
            this._currentParticleSystem = null;
            if (this._particleSystems)
            {
                for each (k in this._particleSystems)
                {
                    k.dispose();
                }
                this._particleSystems = null;
            }
        }

        override protected function updateObject(k:Number, _arg_2:Number):Boolean
        {
            var _local_3:Boolean;
            var _local_4:FurnitureParticleSystem;
            if (super.updateObject(k, _arg_2))
            {
                _local_3 = false;
                if (!this._particleSystems)
                {
                    this._Str_18684();
                    if (this._particleSystems)
                    {
                        this._currentParticleSystem = this._particleSystems[k];
                        _local_3 = true;
                    }
                    else
                    {
                        Logger.log(("ERROR Particle systems could not be read! " + this.object.getType()));
                    }
                }
                else
                {
                    if (((!(k == _currentScale)) || (!(this._particleSystems[k] == this._currentParticleSystem))))
                    {
                        _local_4 = this._particleSystems[k];
                        _local_4._Str_17988(this._currentParticleSystem);
                        if (this._currentParticleSystem)
                        {
                            this._currentParticleSystem.reset();
                        }
                        this._currentParticleSystem = _local_4;
                        _local_3 = true;
                    }
                }
                return true;
            }
            return false;
        }

        override protected function updateSprites(k:int, _arg_2:Boolean, _arg_3:int):void
        {
            super.updateSprites(k, _arg_2, _arg_3);
            if (this._currentParticleSystem)
            {
                this._currentParticleSystem.updateSprites();
            }
        }

        override protected function updateAnimation(k:Number):int
        {
            if (this._currentParticleSystem)
            {
                this._currentParticleSystem.updateAnimation();
            }
            return super.updateAnimation(k);
        }

        override protected function setAnimation(k:int):void
        {
            if (this._currentParticleSystem)
            {
                this._currentParticleSystem.setAnimation(k);
            }
            super.setAnimation(k);
        }

        override protected function getSpriteYOffset(k:int, _arg_2:int, _arg_3:int):int
        {
            if (((this._currentParticleSystem) && (this._currentParticleSystem.controlsSprite(_arg_3))))
            {
                return this._currentParticleSystem.getSpriteYOffset(k, _arg_2, _arg_3);
            }
            return super.getSpriteYOffset(k, _arg_2, _arg_3);
        }

        private function _Str_18684():Boolean
        {
            var _local_5:FurnitureParticleSystem;
            var _local_6:int;
            var _local_7:XML;
            var k:IRoomObject = object;
            if (k == null)
            {
                return false;
            }
            var _local_2:IRoomObjectModel = k.getModel();
            if (_local_2 == null)
            {
                return false;
            }
            var _local_3:String = _local_2.getString(RoomObjectVariableEnum.FURNITURE_FIREWORKS_DATA);
            if (((!(_local_3)) || (_local_3.length == 0)))
            {
                Logger.log("No Particle System Data Found.");
                return false;
            }
            var _local_4:XML = XML(_local_3);
            this._particleSystems = new Dictionary();
            for each (_local_7 in _local_4.particlesystem)
            {
                if (!_local_7.hasOwnProperty("@size"))
                {
                    Logger.log("Particle System does not have size property!");
                }
                else
                {
                    _local_6 = int(_local_7.@size);
                    _local_5 = new FurnitureParticleSystem(this);
                    _local_5.parseData(_local_7);
                    this._particleSystems[_local_6] = _local_5;
                }
            }
            return true;
        }
    }
}
