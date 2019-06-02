package org.openvideoads.vast.overlay
{
    import org.openvideoads.regions.view.RegionView;
    import org.openvideoads.vast.schedule.ads.AdSlot;
    import org.openvideoads.vast.config.groupings.VPAIDConfig;
    import org.openvideoads.regions.RegionController;
    import org.openvideoads.regions.config.RegionViewConfig;
    import org.openvideoads.util.Display;
    import org.openvideoads.vast.model._Str_5226;
    import org.openvideoads.regions.view._Str_4027;
    import org.openvideoads.vast.model._Str_5606;

    public class OverlayView extends RegionView 
    {
        protected var _Str_17170:AdSlot = null;
        protected var _Str_4344:* = null;
        protected var _Str_5258:VPAIDConfig = null;
        protected var _Str_11790:Boolean = false;
        protected var _Str_9253:Number = -1;
        protected var _Str_22534:Boolean = false;
        protected var _Str_23345:Boolean = false;

        public function OverlayView(k:RegionController, _arg_2:RegionViewConfig, _arg_3:Display)
        {
            super(k, _arg_2, _arg_3);
        }

        public function set _Str_5530(k:AdSlot):void
        {
            this._Str_17170 = k;
        }

        public function get _Str_5530():AdSlot
        {
            return this._Str_17170;
        }

        public function _Str_24367():void
        {
            this._Str_17170 = null;
        }

        override public function setHeight():Boolean
        {
            var _local_1:Number;
            if (((expanded) && (_Str_2297.hasExpandedSizing())))
            {
                height = _Str_2297.expandedHeight;
                return true;
            }
            _local_1 = height;
            if (((expanded == false) && (_Str_2297.hasMinimizedHeightBasedOnYPosForDisplayMode(_Str_2758.displayMode))))
            {
                height = _Str_2297.calculateMinimizedHeight(_Str_2758);
                return !(height == _local_1);
            }
            if ((_Str_2297.height is String))
            {
                if (_Str_2297.height.toUpperCase().indexOf("BOTTOM-MARGIN-ADJUSTED") > -1)
                {
                    height = _Str_2758.getMarginAdjustedHeight(_Str_2297.useOverrideMargin);
                    return !(height == _local_1);
                }
            }
            return super.setHeight();
        }

        override public function setVerticalAlignment():Boolean
        {
            var k:int;
            var _local_2:Number;
            var _local_3:Number;
            var _local_4:Boolean;
            if (((_Str_2297.verticalAlignPosition is String) && (!(_Str_2297.verticalAlignPosition == null))))
            {
                k = (_Str_2758.displayHeight * scaleY);
                _local_2 = y;
                _local_3 = _Str_2758.getActiveMargin(_Str_2297.useOverrideMargin);
                _local_4 = false;
                if (_Str_2297.verticalAlignPosition == "TOP")
                {
                    y = (0 + _Str_2297.verticalAlignOffset);
                    _local_4 = true;
                }
                else
                {
                    if (_Str_2297.verticalAlignPosition == "BOTTOM")
                    {
                        y = (((k - height) - _local_3) + _Str_2297.verticalAlignOffset);
                        _local_4 = true;
                    }
                    else
                    {
                        if (_Str_2297.verticalAlignPosition == "CENTER")
                        {
                            y = ((((k - height) - _local_3) / 2) + _Str_2297.verticalAlignOffset);
                            _local_4 = true;
                        }
                        else
                        {
                            y = new Number(_Str_2297.verticalAlignPosition);
                            y = (y + _Str_2297.verticalAlignOffset);
                            _local_4 = true;
                        }
                    }
                }
                if (_local_4)
                {
                    return !(y == _local_2);
                }
            }
            return super.setVerticalAlignment();
        }

        override public function resize(k:Display=null):void
        {
            super.resize(k);
            if (_Str_2758 != null)
            {
                if (((!(this._Str_4344 == null)) && (this._Str_4344 is _Str_5226)))
                {
                    this._Str_4344.resize(this.width, this.height, _Str_2758.displayMode);
                }
            }
        }

        override protected function onFlashContentLoaded():void
        {
            if (this._Str_4344 != null)
            {
                if (this._Str_4344.isInteractive())
                {
                    if (this._Str_4344.registerAsVPAID(new VPAIDWrapper(_Str_2450.content, this._Str_11790, this._Str_9253)))
                    {
                        show();
                        this._Str_4344.startVPAID(this.width, this.height, ((_Str_2758 != null) ? _Str_2758.displayMode : (Display.NORMAL)), ((this._Str_5258 != null) ? this._Str_5258.supplyReferrer : (false)), ((this._Str_5258 != null) ? this._Str_5258.referrer : null));
                    }
                }
            }
        }

        public function _Str_25324():void
        {
            if (this._Str_4344 != null)
            {
                this._Str_4344.unload();
                this._Str_4344 = null;
            }
        }

        public function _Str_19513(k:_Str_4027, _arg_2:VPAIDConfig, _arg_3:String, _arg_4:Boolean=false, _arg_5:Boolean=false, _arg_6:Boolean=false, _arg_7:Boolean=false, _arg_8:Number=-1):void
        {
            this._Str_4344 = k;
            this._Str_5258 = _arg_2;
            this._Str_11790 = _arg_5;
            this._Str_9253 = _arg_8;
            this._Str_22534 = _arg_6;
            this._Str_23345 = _arg_7;
            if (this._Str_4344.isInteractive())
            {
                scalable = ((_arg_7) ? _arg_2.enableLinearScaling : _arg_2.enableNonLinearScaling);
                _Str_15552(this._Str_4344, _arg_3, false);
            }
            else
            {
                _Str_15552(this._Str_4344, _arg_3, _arg_4);
            }
        }

        public function _Str_25726(k:_Str_5606, _arg_2:Number, _arg_3:Number, _arg_4:Boolean, _arg_5:String):void
        {
            if (k != null)
            {
                _Str_22127(k.imageURL, k.width, k.height, _arg_2, _arg_3, _arg_4, k.maintainAspectRatio, _arg_5);
            }
        }
    }
}
