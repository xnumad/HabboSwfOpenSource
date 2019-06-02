package com.sulake.habbo.room.object.visualization.furniture
{
    import com.sulake.core.utils.Map;
    import flash.display.BitmapData;
    import com.sulake.room.object.visualization.IRoomObjectSprite;
    import flash.geom.ColorTransform;
    import flash.geom.Matrix;
    import flash.geom.Rectangle;
    import com.sulake.room.object.visualization.utils.IGraphicAsset;
    import flash.geom.Point;
    import flash.display.BlendMode;
    import flash.geom.Vector3D;

    public class FurnitureParticleSystem 
    {
        private var _emitters:Map;
        private var _visualization:FurnitureAnimatedVisualization;
        private var _size:int;
        private var _canvasId:int;
        private var _offsetY:int;
        private var _currentEmitter:FurnitureParticleSystemEmitter;
        private var _canvas:BitmapData;
        private var _roomSprite:IRoomObjectSprite;
        private var _hasIgnited:Boolean = false;
        private var _centerX:int = 0;
        private var _centerY:int = 0;
        private var _scaleMultiplier:Number = 1;
        private var _blackOverlay:BitmapData;
        private var _blackOverlayAlphaTransform:ColorTransform;
        private var _particleColorTransform:ColorTransform;
        private var _identityMatrix:Matrix;
        private var _translationMatrix:Matrix;
        private var _blend:Number = 1;
        private var _bgColor:uint = 0xFF000000;

        public function FurnitureParticleSystem(k:FurnitureAnimatedVisualization)
        {
            this._emitters = new Map();
            this._visualization = k;
            this._blackOverlayAlphaTransform = new ColorTransform();
            this._blackOverlayAlphaTransform.alphaMultiplier = 1;
            this._particleColorTransform = new ColorTransform();
            this._identityMatrix = new Matrix();
            this._translationMatrix = new Matrix();
        }

        public function dispose():void
        {
            var k:FurnitureParticleSystemEmitter;
            for each (k in this._emitters)
            {
                k.dispose();
            }
            this._emitters = null;
            if (this._canvas)
            {
                this._canvas.dispose();
                this._canvas = null;
            }
            if (this._blackOverlay)
            {
                this._blackOverlay.dispose();
                this._blackOverlay = null;
            }
            this._blackOverlayAlphaTransform = null;
            this._particleColorTransform = null;
            this._identityMatrix = null;
            this._translationMatrix = null;
        }

        public function reset():void
        {
            if (this._currentEmitter)
            {
                this._currentEmitter.reset();
            }
            this._currentEmitter = null;
            this._hasIgnited = false;
            this.updateCanvas();
        }

        public function setAnimation(k:int):void
        {
            if (this._currentEmitter)
            {
                this._currentEmitter.reset();
            }
            this._currentEmitter = this._emitters[k];
            this._hasIgnited = false;
            this.updateCanvas();
        }

        private function updateCanvas():void
        {
            if (!this._currentEmitter)
            {
                return;
            }
            if (this._canvasId >= 0)
            {
                this._roomSprite = this._visualization.getSprite(this._canvasId);
                if (((this._roomSprite) && (this._roomSprite.asset)))
                {
                    if (((this._roomSprite.width <= 1) || (this._roomSprite.height <= 1)))
                    {
                        return;
                    }
                    if (((this._canvas) && ((!(this._canvas.width == this._roomSprite.width)) || (!(this._canvas.height == this._roomSprite.height)))))
                    {
                        this._canvas = null;
                    }
                    if (this._canvas == null)
                    {
                        this._canvas = this._roomSprite.asset.clone();
                        if (this._blackOverlayAlphaTransform.alphaMultiplier != 1)
                        {
                            this._blackOverlay = new BitmapData(this._canvas.width, this._canvas.height, true, this._bgColor);
                        }
                    }
                    this._centerX = -(this._roomSprite.offsetX);
                    this._centerY = -(this._roomSprite.offsetY);
                    this._roomSprite.asset = this._canvas;
                }
                if (this._canvas)
                {
                    this._canvas.fillRect(this._canvas.rect, this._bgColor);
                }
                if (this._blackOverlay)
                {
                    this._blackOverlay.fillRect(this._blackOverlay.rect, this._bgColor);
                }
            }
        }

        public function getSpriteYOffset(k:int, _arg_2:int, _arg_3:int):int
        {
            if (((this._currentEmitter) && (this._currentEmitter.roomObjectSpriteId == _arg_3)))
            {
                return this._currentEmitter.y * this._scaleMultiplier;
            }
            return 0;
        }

        public function controlsSprite(k:int):Boolean
        {
            if (this._currentEmitter)
            {
                return this._currentEmitter.roomObjectSpriteId == k;
            }
            return false;
        }

        public function updateSprites():void
        {
            if (((!(this._currentEmitter)) || (!(this._roomSprite))))
            {
                return;
            }
            if (((this._canvas) && (!(this._roomSprite.asset == this._canvas))))
            {
                this._roomSprite.asset = this._canvas;
                this._roomSprite.asset.width;
            }
            if (this._hasIgnited)
            {
                if (this._currentEmitter.roomObjectSpriteId >= 0)
                {
                    this._visualization.getSprite(this._currentEmitter.roomObjectSpriteId).visible = false;
                }
            }
        }

        public function updateAnimation():void
        {
            var _local_3:int;
            var _local_4:int;
            var _local_5:Rectangle;
            var _local_6:IGraphicAsset;
            var _local_7:BitmapData;
            var _local_9:Point;
            var _local_10:Point;
            var _local_11:FurnitureParticleSystemParticle;
            if (((!(this._currentEmitter)) || (!(this._roomSprite))))
            {
                return;
            }
            var k:Number = 10;
            var _local_2:Number = 0;
            var _local_8:int;
            if (((!(this._hasIgnited)) && (this._currentEmitter.hasIgnited)))
            {
                this._hasIgnited = true;
            }
            _local_8 = (this._offsetY * this._scaleMultiplier);
            this._currentEmitter.update();
            if (this._hasIgnited)
            {
                if (this._currentEmitter.roomObjectSpriteId >= 0)
                {
                    this._visualization.getSprite(this._currentEmitter.roomObjectSpriteId).visible = false;
                }
                if (!this._canvas)
                {
                    this.updateCanvas();
                }
                this._canvas.lock();
                if (this._blackOverlayAlphaTransform.alphaMultiplier == 1)
                {
                    this._canvas.fillRect(this._canvas.rect, this._bgColor);
                }
                else
                {
                    this._canvas.draw(this._blackOverlay, this._identityMatrix, this._blackOverlayAlphaTransform, BlendMode.NORMAL, null, false);
                }
                for each (_local_11 in this._currentEmitter.particles)
                {
                    _local_2 = _local_11.y;
                    _local_3 = (this._centerX + ((((_local_11.x - _local_11.z) * k) / 10) * this._scaleMultiplier));
                    _local_4 = ((this._centerY - _local_8) + ((((_local_2 + ((_local_11.x + _local_11.z) / 2)) * k) / 10) * this._scaleMultiplier));
                    _local_6 = _local_11.getAsset();
                    if (_local_6)
                    {
                        _local_7 = (_local_6.asset.content as BitmapData);
                        if (((_local_11.fade) && (_local_11.alphaMultiplier < 1)))
                        {
                            this._translationMatrix.identity();
                            this._translationMatrix.translate((_local_3 + _local_6.offsetX), (_local_4 + _local_6.offsetY));
                            this._particleColorTransform.alphaMultiplier = _local_11.alphaMultiplier;
                            this._canvas.draw(_local_7, this._translationMatrix, this._particleColorTransform, BlendMode.NORMAL, null, false);
                        }
                        else
                        {
                            _local_10 = new Point((_local_3 + _local_6.offsetX), (_local_4 + _local_6.offsetY));
                            this._canvas.copyPixels(_local_7, _local_7.rect, _local_10, null, null, true);
                        }
                    }
                    else
                    {
                        _local_5 = new Rectangle((_local_3 - 1), (_local_4 - 1), 2, 2);
                        this._canvas.fillRect(_local_5, 0xFFFFFFFF);
                    }
                }
                this._canvas.unlock();
            }
        }

        public function parseData(k:XML):void
        {
            var _local_3:IRoomObjectSprite;
            var _local_4:XML;
            var _local_5:int;
            var _local_6:String;
            var _local_7:int;
            var _local_8:FurnitureParticleSystemEmitter;
            var _local_9:int;
            var _local_10:int;
            var _local_11:int;
            var _local_12:int;
            var _local_13:Number;
            var _local_14:Number;
            var _local_15:Number;
            var _local_16:Number;
            var _local_17:String;
            var _local_18:Number;
            var _local_19:int;
            var _local_20:Boolean;
            var _local_21:Boolean;
            var _local_22:Array;
            var _local_23:IGraphicAsset;
            var _local_24:XML;
            var _local_25:XML;
            this._size = parseInt(k.@size);
            this._canvasId = ((k.hasOwnProperty("@canvas_id")) ? parseInt(k.@canvas_id) : -1);
            this._offsetY = ((k.hasOwnProperty("@offset_y")) ? parseInt(k.@offset_y) : 10);
            this._scaleMultiplier = (this._size / 64);
            this._blend = ((k.hasOwnProperty("@blend")) ? Number(k.@blend) : 1);
            this._blend = Math.min(this._blend, 1);
            this._blackOverlayAlphaTransform.alphaMultiplier = this._blend;
            var _local_2:String = ((k.hasOwnProperty("@bgcolor")) ? String(k.@bgcolor) : "0");
            this._bgColor = ((k.hasOwnProperty("@bgcolor")) ? parseInt(_local_2, 16) : 0xFF000000);
            for each (_local_4 in k.emitter)
            {
                _local_5 = parseInt(_local_4.@id);
                _local_6 = _local_4.@name;
                _local_7 = parseInt(_local_4.@sprite_id);
                _local_8 = new FurnitureParticleSystemEmitter(_local_6, _local_7);
                this._emitters[_local_5] = _local_8;
                _local_9 = parseInt(_local_4.@max_num_particles);
                _local_10 = parseInt(_local_4.@particles_per_frame);
                _local_11 = ((_local_4.hasOwnProperty("@burst_pulse")) ? parseInt(_local_4.@burst_pulse) : 1);
                _local_12 = parseInt(_local_4.@fuse_time);
                _local_13 = Number(_local_4.simulation.@force);
                _local_14 = Number(_local_4.simulation.@direction);
                _local_15 = Number(_local_4.simulation.@gravity);
                _local_16 = Number(_local_4.simulation.@airfriction);
                _local_17 = _local_4.simulation.@shape;
                _local_18 = Number(_local_4.simulation.@energy);
                for each (_local_24 in _local_4.particles.particle)
                {
                    _local_19 = parseInt(_local_24.@lifetime);
                    _local_20 = ((_local_24.@is_emitter == "false") ? false : true);
                    _local_21 = (((_local_24.hasOwnProperty("@fade")) && (_local_24.@fade == "true")) ? true : false);
                    _local_22 = [];
                    for each (_local_25 in _local_24.frame)
                    {
                        _local_23 = this._visualization.assetCollection.getAsset(_local_25.@name);
                        _local_22.push(_local_23);
                    }
                    _local_8.configureParticle(_local_19, _local_20, _local_22, _local_21);
                }
                _local_8.setup(_local_9, _local_10, _local_13, new Vector3D(0, _local_14, 0), _local_15, _local_16, _local_17, _local_18, _local_12, _local_11);
            }
        }

        public function _Str_17988(k:FurnitureParticleSystem):void
        {
            var _local_2:int;
            if (((k._emitters) && (k._currentEmitter)))
            {
                _local_2 = k._emitters.getKey(k._emitters.getValues().indexOf(k._currentEmitter));
            }
            this.setAnimation(_local_2);
            if (this._currentEmitter)
            {
                this._currentEmitter._Str_17988(k._currentEmitter, (Number(k._size) / Number(this._size)));
            }
            this._canvas = null;
        }
    }
}
