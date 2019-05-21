package org.openvideoads.vast.overlay
{
    import org.openvideoads.regions.RegionController;
    import org.openvideoads.vast.VASTController;
    import org.openvideoads.vast.overlay.button.skip._Str_8718;
    import org.openvideoads.vast.model._Str_5226;
    import org.openvideoads.util.Display;
    import org.openvideoads.vast.config.groupings._Str_5516;
    import org.openvideoads.regions.config.RegionViewConfig;
    import org.openvideoads.regions.view.RegionView;
    import org.openvideoads.regions.config.CloseButtonConfig;
    import org.openvideoads.vast.overlay.button.skip._Str_11186;
    import org.openvideoads.vast.overlay.button.skip._Str_12074;
    import org.openvideoads.vast.overlay.button.skip.LoadableImageSkipAdButton;
    import org.openvideoads.vast.schedule.ads.AdSlot;
    import org.openvideoads.vast.model.NonLinearVideoAd;
    import org.openvideoads.regions.view._Str_4027;
    import org.openvideoads.vast.model._Str_5606;
    import org.openvideoads.vast.events._Str_2833;
    import org.openvideoads.vast.events._Str_3525;
    import org.openvideoads.vast.overlay.button.skip._Str_4790;
    import org.openvideoads.vpaid._Str_5844;
    import org.openvideoads.vpaid._Str_2291;
    import flash.events.MouseEvent;

    public class OverlayController extends RegionController 
    {
        protected static const _Str_13197:String = (('.title { font-family: "sans-serif"; font-size: 18pt; font-style: bold; color:#FAF8CC; leading:5px; } ' + '.description { font-family: "sans-serif"; font-size: 15pt; leading:3px; } ') + '.callToActionTitle { font-family: "sans-serif"; font-size: 15pt; font-style: bold; color:#FBB917; }');

        protected var _Str_2335:VASTController;
        protected var _Str_4761:_Str_9170 = null;
        protected var _Str_3832:_Str_8718 = null;
        protected var _Str_10291:Boolean = false;
        protected var _Str_4185:_Str_10839 = null;
        protected var _Str_2962:_Str_5226 = null;

        public function OverlayController(k:VASTController, _arg_2:Display, _arg_3:_Str_5516)
        {
            this._Str_2335 = k;
            super(_arg_2, _arg_3);
        }

        override protected function newRegion(k:RegionController, _arg_2:RegionViewConfig, _arg_3:Display):RegionView
        {
            return new OverlayView(k, _arg_2, _arg_3);
        }

        override protected function createPredefinedRegion(k:String):RegionView
        {
            var _local_2:RegionViewConfig;
            switch (k)
            {
                case "reserved-system-message":
                    return (_Str_2658(new RegionViewConfig({
                        "id":"reserved-system-message",
                        "verticalAlign":"bottom:-2",
                        "backgroundColor":_Str_2692("transparent"),
                        "height":20,
                        "width":"100pct",
                        "style":('.normaltext { font-family: "sans-serif"; font-size: 12pt; font-style: normal; color:#CCCCCC } ' + '.smalltext { font-family: "sans-serif"; font-size: 10pt; color:#CCCCCC }'),
                        "closeButton":this._Str_3712,
                        "useOverrideMargin":true
                    })));
                case "reserved-top":
                    return (_Str_2658(new RegionViewConfig({
                        "id":"reserved-top",
                        "verticalAlign":"top",
                        "width":"100pct",
                        "height":"50",
                        "closeButton":this._Str_3712
                    })));
                case "reserved-fullscreen":
                    return (_Str_2658(new RegionViewConfig({
                        "id":"reserved-fullscreen",
                        "verticalAlign":0,
                        "horizontalAlign":0,
                        "width":"100pct",
                        "height":"100pct",
                        "backgroundColor":_Str_2692("#000000"),
                        "closeButton":this._Str_3712
                    })));
                case "reserved-fullscreen-black-no-close-button-non-clickable":
                    return (_Str_2658(new RegionViewConfig({
                        "id":"reserved-fullscreen-black-no-close-button-non-clickable",
                        "verticalAlign":0,
                        "horizontalAlign":0,
                        "width":"100pct",
                        "height":"100pct",
                        "backgroundColor":_Str_2692("#000000"),
                        "clickable":false,
                        "closeButton":new CloseButtonConfig({"enabled":false})
                    })));
                case "reserved-fullscreen-black-no-close-button-non-clickable-minimize-rules":
                    return (_Str_2658(new RegionViewConfig({
                        "id":"reserved-fullscreen-black-no-close-button-non-clickable-minimize-rules",
                        "verticalAlign":0,
                        "horizontalAlign":0,
                        "width":"100pct",
                        "height":"100pct",
                        "backgroundColor":_Str_2692("#000000"),
                        "clickable":false,
                        "closeButton":new CloseButtonConfig({"enabled":false}),
                        "minimizedHeight":"controls-ypos-when-visible-all-modes"
                    })));
                case "reserved-fullscreen-black-no-close-button-non-clickable-with-cb-height":
                    return (_Str_2658(new RegionViewConfig({
                        "id":"reserved-fullscreen-black-no-close-button-non-clickable-with-cb-height",
                        "verticalAlign":0,
                        "horizontalAlign":0,
                        "width":"100pct",
                        "height":"100pct",
                        "backgroundColor":_Str_2692("#000000"),
                        "clickable":false,
                        "closeButton":new CloseButtonConfig({"enabled":false}),
                        "additionalHeight":"controls-height-when-normal",
                        "minimizedHeight":"controls-ypos-when-visible-fullscreen"
                    })));
                case "reserved-fullscreen-transparent-no-close-button-non-clickable":
                    return (_Str_2658(new RegionViewConfig({
                        "id":"reserved-fullscreen-black-no-close-button-non-clickable",
                        "verticalAlign":0,
                        "horizontalAlign":0,
                        "width":"100pct",
                        "height":"100pct",
                        "backgroundColor":_Str_2692("transparent"),
                        "clickable":true,
                        "closeButton":new CloseButtonConfig({"enabled":false}),
                        "autoHide":false
                    })));
                case "reserved-fullscreen-transparent-no-close-button-non-clickable-bottom-margin-adjusted":
                    return (_Str_2658(new RegionViewConfig({
                        "id":"reserved-fullscreen-transparent-no-close-button-non-clickable-bottom-margin-adjusted",
                        "verticalAlign":0,
                        "horizontalAlign":0,
                        "width":"100pct",
                        "height":"100pct",
                        "backgroundColor":_Str_2692("transparent"),
                        "clickable":true,
                        "closeButton":new CloseButtonConfig({"enabled":false}),
                        "autoHide":false
                    })));
                case "reserved-bottom-w100pct-h78px-000000-o50":
                    return (_Str_2658(new RegionViewConfig({
                        "id":"reserved-bottom-w100pct-h78px-000000-o50",
                        "verticalAlign":"bottom",
                        "backgroundColor":_Str_2692("#000000"),
                        "opacity":0.5,
                        "width":"100pct",
                        "height":78,
                        "padding":"5 5 5 5",
                        "style":_Str_13197,
                        "closeButton":this._Str_3712
                    })));
                case "reserved-bottom-w100pct-h50px-000000-o50":
                    return (_Str_2658(new RegionViewConfig({
                        "id":"reserved-bottom-w100pct-h50px-000000-o50",
                        "verticalAlign":"bottom",
                        "backgroundColor":_Str_2692("#000000"),
                        "opacity":0.5,
                        "width":"100pct",
                        "height":50,
                        "closeButton":this._Str_3712
                    })));
                case "reserved-bottom-w100pct-h50px-transparent-0m":
                    return (_Str_2658(new RegionViewConfig({
                        "id":"reserved-bottom-w100pct-h50px-transparent-0m",
                        "verticalAlign":"bottom",
                        "backgroundColor":_Str_2692("transparent"),
                        "width":"100pct",
                        "height":50,
                        "padding":"-10 -10 -10 -10",
                        "closeButton":this._Str_3712
                    })));
                case "reserved-bottom-w450px-h50px-000000-o50":
                    return (_Str_2658(new RegionViewConfig({
                        "id":"reserved-bottom-w450px-h50px-000000-o50",
                        "verticalAlign":"bottom",
                        "backgroundColor":_Str_2692("#000000"),
                        "opacity":0.5,
                        "width":450,
                        "height":50,
                        "closeButton":this._Str_3712
                    })));
                case "reserved-bottom-w450px-h50px-transparent":
                    return (_Str_2658(new RegionViewConfig({
                        "id":"reserved-bottom-w450px-h50px-transparent",
                        "verticalAlign":"bottom",
                        "backgroundColor":_Str_2692("transparent"),
                        "width":450,
                        "height":50,
                        "closeButton":this._Str_3712
                    })));
                case "reserved-bottom-w450px-h50px-transparent-0m":
                    return (_Str_2658(new RegionViewConfig({
                        "id":"reserved-bottom-w450px-h50px-transparent-0m",
                        "verticalAlign":"bottom",
                        "backgroundColor":_Str_2692("transparent"),
                        "width":450,
                        "height":50,
                        "padding":"-10 -10 -10 -10",
                        "closeButton":this._Str_3712
                    })));
                case "reserved-bottom-center-w450px-h50px-000000-o50":
                    return (_Str_2658(new RegionViewConfig({
                        "id":"reserved-bottom-center-w450px-h50px-000000-o50",
                        "verticalAlign":"bottom",
                        "backgroundColor":_Str_2692("#000000"),
                        "horizontalAlign":"center",
                        "opacity":0.5,
                        "width":450,
                        "height":50,
                        "closeButton":this._Str_3712
                    })));
                case "reserved-bottom-center-w450px-h50px-transparent":
                    return (_Str_2658(new RegionViewConfig({
                        "id":"reserved-bottom-center-w450px-h50px-transparent",
                        "verticalAlign":"bottom",
                        "horizontalAlign":"center",
                        "backgroundColor":_Str_2692("transparent"),
                        "width":450,
                        "height":50,
                        "closeButton":this._Str_3712
                    })));
                case "reserved-bottom-center-w450px-h50px-transparent-0m":
                    return (_Str_2658(new RegionViewConfig({
                        "id":"reserved-bottom-center-w450px-h50px-transparent-0m",
                        "verticalAlign":"bottom",
                        "horizontalAlign":"center",
                        "backgroundColor":_Str_2692("transparent"),
                        "width":450,
                        "height":50,
                        "padding":"-10 -10 -10 -10",
                        "closeButton":this._Str_3712
                    })));
                case "reserved-bottom-center-w300px-h50px-000000-o50":
                    return (_Str_2658(new RegionViewConfig({
                        "id":"reserved-bottom-center-w300px-h50px-000000-o50",
                        "verticalAlign":"bottom",
                        "backgroundColor":_Str_2692("#000000"),
                        "horizontalAlign":"center",
                        "opacity":0.5,
                        "width":300,
                        "height":50,
                        "closeButton":this._Str_3712
                    })));
                case "reserved-bottom-center-w300px-h50px-transparent":
                    return (_Str_2658(new RegionViewConfig({
                        "id":"reserved-bottom-center-w300px-h50px-transparent",
                        "verticalAlign":"bottom",
                        "horizontalAlign":"center",
                        "backgroundColor":_Str_2692("transparent"),
                        "width":300,
                        "height":50,
                        "closeButton":this._Str_3712
                    })));
                case "reserved-bottom-center-w300px-h50px-transparent-0m":
                    return (_Str_2658(new RegionViewConfig({
                        "id":"reserved-bottom-center-w300px-h50px-transparent-0m",
                        "verticalAlign":"bottom",
                        "horizontalAlign":"center",
                        "backgroundColor":_Str_2692("transparent"),
                        "width":300,
                        "height":50,
                        "padding":"-10 -10 -10 -10",
                        "closeButton":this._Str_3712
                    })));
            }
            return _Str_15249;
        }

        override protected function createRegionViews():void
        {
            var k:int;
            var _local_2:RegionViewConfig;
            if (this._Str_2335.config.visuallyCueLinearAdClickThrough)
            {
                this._Str_4761 = new _Str_9170(this, new RegionViewConfig({
                    "id":"reserved-clickable-click-through",
                    "verticalAlign":0,
                    "horizontalAlign":0,
                    "scaleRate":0.75,
                    "width":"100pct",
                    "height":"100pct",
                    "clickable":true,
                    "closeButton":{"enabled":false},
                    "backgroundColor":_Str_2692("transparent"),
                    "autoHide":false
                }), this._Str_2335.config.adsConfig.clickSignConfig, _Str_2758);
                _Str_3178.push(this._Str_4761);
                addChild(this._Str_4761);
                setChildIndex(this._Str_4761, 0);
            }
            _Str_15249 = _Str_2658(new RegionViewConfig({
                "id":"reserved-bottom-w100pct-h50px-transparent",
                "verticalAlign":"bottom",
                "backgroundColor":_Str_2692("transparent"),
                "width":"100pct",
                "height":50,
                "closeButton":this._Str_3712
            }));
            if (_Str_2297 != null)
            {
                if (_Str_2297.hasRegionDefinitions())
                {
                    k = 0;
                    while (k < _Str_2297.regions.length)
                    {
                        _Str_2658(_Str_2297.regions[k]);
                        k++;
                    }
                }
            }
            if (this._Str_2335.canSkipOnLinearAd())
            {
                _local_2 = null;
                if (this._Str_2335.config.adsConfig.skipAdConfig.isHtmlButton())
                {
                    _local_2 = new _Str_11186(this._Str_2335.config.adsConfig.skipAdConfig);
                }
                else
                {
                    if (this._Str_2335.config.adsConfig.skipAdConfig.isStandardImageButton())
                    {
                        _local_2 = new _Str_12074(this._Str_2335.config.adsConfig.skipAdConfig);
                    }
                    else
                    {
                        if (this._Str_2335.config.adsConfig.skipAdConfig.isCustomImageButton())
                        {
                            _local_2 = new LoadableImageSkipAdButton(this._Str_2335.config.adsConfig.skipAdConfig);
                        }
                    }
                }
                if (_local_2 != null)
                {
                    this._Str_3832 = new _Str_8718(this, _local_2, _Str_2758, this._Str_2335.config.adsConfig.skipAdConfig.width, this._Str_2335.config.adsConfig.skipAdConfig.height);
                    _Str_3178.push(this._Str_3832);
                    addChild(this._Str_3832);
                    setChildIndex(this._Str_3832, 0);
                }
            }
        }

        public function _Str_16648():void
        {
            if (this._Str_19851())
            {
                if (this._Str_2962._Str_7544())
                {
                    _Str_21107([this._Str_2962._Str_4668()]);
                    return;
                }
            }
            _Str_9717();
        }

        public function _Str_23447():void
        {
            this._Str_5888();
            if (this._Str_3832 != null)
            {
                this._Str_3832.hide();
            }
            this._Str_20070();
        }

        public function _Str_23274(k:AdSlot):void
        {
            this._Str_4761._Str_5530 = k;
            this._Str_4761.show();
            this._Str_10291 = false;
        }

        public function _Str_20070():void
        {
            this._Str_4761._Str_5530 = null;
            this._Str_4761.hide();
            this._Str_10291 = false;
        }

        public function _Str_19443():void
        {
            if (this._Str_4761.visible)
            {
                this._Str_4761.hide();
                this._Str_10291 = true;
            }
            if (((this._Str_2335.canSkipOnLinearAd()) && (!(this._Str_3832 == null))))
            {
                this._Str_3832.hide();
            }
            if (this._Str_4185 != null)
            {
                this._Str_4185.hide();
            }
        }

        public function _Str_23900():void
        {
            if (this._Str_10291)
            {
                this._Str_4761.show();
                this._Str_10291 = false;
            }
            if (((this._Str_2335.canSkipOnLinearAd()) && (!(this._Str_3832 == null))))
            {
                if (this._Str_3832.active)
                {
                    this._Str_3832.show();
                }
            }
            if (this._Str_4185 != null)
            {
                this._Str_4185.show();
            }
        }

        public function _Str_26264():Boolean
        {
            return this._Str_4761.visible;
        }

        public function clearOverlay(k:String):void
        {
            var _local_2:OverlayView = (_Str_3679(k) as OverlayView);
            if (_local_2 != null)
            {
                _local_2.hide();
                _local_2._Str_25324();
                _local_2._Str_24367();
            }
        }

        protected function _Str_24590(k:int):int
        {
            if (_Str_2758 != null)
            {
                if (_Str_2758.displayWidth < k)
                {
                    return _Str_2758.displayWidth;
                }
            }
            return k;
        }

        protected function _parser1(k:int):int
        {
            if (_Str_2758 != null)
            {
                if (_Str_2758.displayHeight < k)
                {
                    return _Str_2758.displayHeight;
                }
            }
            return k;
        }

        protected function _Str_18966(k:AdSlot, _arg_2:NonLinearVideoAd, _arg_3:String="bottom", _arg_4:CloseButtonConfig=null):OverlayView
        {
            var _local_5:Number = -1;
            var _local_6:Number = -1;
            var _local_7:Number = -1;
            var _local_8:Number = -1;
            var _local_9:String;
            if (_arg_2.isInteractive())
            {
                _local_5 = _arg_2.width;
                _local_6 = _arg_2.height;
                if (_arg_2._Str_16096())
                {
                    _local_7 = _arg_2.expandedWidth;
                    _local_8 = _arg_2.expandedHeight;
                }
            }
            else
            {
                if (_arg_2.activeDisplayRegion.hasSize())
                {
                    _local_5 = _arg_2.activeDisplayRegion.width;
                    _local_6 = _arg_2.activeDisplayRegion.height;
                }
                else
                {
                    _local_5 = this._Str_24590(_arg_2.width);
                    _local_6 = this._parser1(_arg_2.height);
                }
                _local_9 = (((_arg_2._Str_18935()) || (_arg_2._Str_15494())) ? "5 5 5 5" : null);
            }
            return _Str_20101(_arg_2.uid, _local_5, _local_6, _arg_3, _arg_4, true, _Str_13197, _local_9, _local_7, _local_8, _arg_2.scale, (!(_arg_2.isInteractive()))) as OverlayView;
        }

        public function displayNonLinearAd(k:_Str_2833):void
        {
            var _local_3:NonLinearVideoAd;
            var _local_4:OverlayView;
            var _local_5:String;
            var _local_6:String;
            var _local_7:String;
            var _local_2:AdSlot = k.adSlot;
            if (_local_2 != null)
            {
                _local_3 = k.nonLinearVideoAd;
                if (_local_3.hasActiveDisplayRegion())
                {
                    if (_local_3.isInteractive())
                    {
                        return;
                    }
                    _local_4 = null;
                    _local_5 = k.nonLinearVideoAd.getActiveDisplayRegionID();
                    if (_Str_14006(_local_5))
                    {
                        _local_4 = this._Str_18966(_local_2, _local_3, _Str_15235(_local_5));
                    }
                    else
                    {
                        _local_4 = (_Str_3679(_local_5) as OverlayView);
                        if (_local_4 != null)
                        {
                        }
                        else
                        {
                            _local_4 = this._Str_18966(_local_2, _local_3, _Str_15235(_local_5));
                        }
                    }
                    if (_local_4 != null)
                    {
                        _local_4.hide();
                        _local_4._Str_5530 = _local_2;
                        _local_4.autoHide = (!(k.nonLinearVideoAd.activeDisplayRegion.keepVisibleAfterClick));
                        _local_4.scalable = k.nonLinearVideoAd.activeDisplayRegion.enableScaling;
                        if (_local_3._Str_8352())
                        {
                            _local_4._Str_19513((_local_3 as _Str_4027), this._Str_2335.config.adsConfig.vpaidConfig, this._Str_2335.config.adsConfig.allowDomains, ((_local_3._Str_5569()) ? true : _local_3.hasAccompanyingVideoAd()));
                        }
                        else
                        {
                            if ((((_local_3 is _Str_5606) && (_local_3.scale)) && (k.nonLinearVideoAd.activeDisplayRegion.enableScaling)))
                            {
                                _local_4._Str_25726((_local_3 as _Str_5606), ((k.nonLinearVideoAd.activeDisplayRegion.hasWidthSpecified()) ? k.nonLinearVideoAd.activeDisplayRegion.width : (this._Str_2335.playerWidth)), ((k.nonLinearVideoAd.activeDisplayRegion.hasHeightSpecified()) ? k.nonLinearVideoAd.activeDisplayRegion.height : (this._Str_2335.playerHeight)), k.nonLinearVideoAd.activeDisplayRegion.hasSize(), this._Str_2335.config.adsConfig.allowDomains);
                            }
                            else
                            {
                                _local_6 = null;
                                _local_7 = k.nonLinearVideoAd.getContent();
                                if (_local_3._Str_5569())
                                {
                                    _local_6 = (('<a href="' + _local_3.clickThroughs[0].url) + '" target="_blank">');
                                    _local_6 = (_local_6 + _local_7);
                                    _local_6 = (_local_6 + "</a>");
                                }
                                else
                                {
                                    _local_6 = _local_7;
                                }
                                _local_4.html = _local_6;
                            }
                        }
                        _local_4.show();
                    }
                    else
                    {
                        _local_3.clearActiveDisplayRegion();
                    }
                }
            }
        }

        public function hideNonLinearAd(k:_Str_2833):void
        {
            var _local_3:NonLinearVideoAd;
            var _local_4:String;
            var _local_2:AdSlot = k.adSlot;
            if (_local_2 != null)
            {
                _local_3 = k.nonLinearVideoAd;
                _local_4 = k.nonLinearVideoAd.getActiveDisplayRegionID();
                if (_Str_14006(_local_4))
                {
                    _local_4 = _local_3.uid;
                }
                this.clearOverlay(_local_4);
            }
        }

        public function _Str_12288(k:_Str_3525):void
        {
            var _local_2:RegionView;
            if (k != null)
            {
                if (k.notice.region != undefined)
                {
                    _local_2 = _Str_3679(k.notice.region);
                    if (_local_2 != null)
                    {
                        this._Str_4185 = new _Str_10839(k.notice.message, k.duration, _local_2);
                        this._Str_4185.show();
                    }
                }
            }
        }

        public function _Str_26234(k:_Str_3525):void
        {
            if (this._Str_4185 == null)
            {
                this._Str_12288(k);
            }
            else
            {
                this._Str_4185._Str_21375(k.duration);
            }
        }

        public function _Str_5888(k:_Str_3525=null):void
        {
            if (k != null)
            {
                if (k.notice.region != undefined)
                {
                    if (this._Str_4185 != null)
                    {
                        this._Str_4185.hide();
                        this._Str_4185 = null;
                    }
                }
            }
            else
            {
                if (this._Str_4185 != null)
                {
                    this._Str_4185.hide();
                    this._Str_4185 = null;
                }
            }
        }

        public function activateLinearAdSkipButton(k:_Str_4790):void
        {
            if (this._Str_3832 != null)
            {
                this._Str_3832._Str_23238(k._Str_25545);
                this._Str_3832.activate();
                setChildIndex(this._Str_3832, (numChildren - 1));
            }
        }

        public function deactivateLinearAdSkipButton(k:_Str_4790):void
        {
            if (this._Str_3832 != null)
            {
                this._Str_3832.deactivate();
            }
        }

        public function _Str_26153():Boolean
        {
            return !(this._Str_2962 == null);
        }

        public function _Str_14186():Boolean
        {
            if (this._Str_2962 != null)
            {
                return this._Str_2962.isRunning();
            }
            return false;
        }

        public function _Str_20036():_Str_5844
        {
            if (this._Str_2962 != null)
            {
                return this._Str_2962.getVPAID();
            }
            return null;
        }

        public function _Str_16555(k:AdSlot, _arg_2:Object, _arg_3:Boolean=false, _arg_4:Number=-1, _arg_5:Boolean=false, _arg_6:Boolean=true):void
        {
            k._Str_11204();
            if (k.isInteractive())
            {
                this._Str_13449();
                if (k.isLinear())
                {
                    this._Str_20061((k.getFlashMediaToPlay(displayWidth, displayHeight, true) as _Str_5226), k, _arg_2, _arg_3, _arg_4, _arg_5, _arg_6);
                }
                else
                {
                    this._Str_20061((k._Str_14530() as _Str_5226), k, _arg_2, _arg_3, _arg_4, false, _arg_6);
                }
            }
            else
            {
                _arg_2.onError(new _Str_2291(_Str_2291.AdError, "Ad is not a VPAID SWF"));
            }
        }

        public function _Str_25060():void
        {
            if (this._Str_2962 != null)
            {
                this._Str_2962.pause();
            }
        }

        public function _Str_25397():void
        {
            if (this._Str_2962 != null)
            {
                this._Str_2962.resume();
            }
        }

        protected function _Str_19851():Boolean
        {
            return !(this._Str_2962 == null);
        }

        protected function _Str_22223():void
        {
            if (this._Str_2962 != null)
            {
                this._Str_2962.unload();
                this._Str_2962 = null;
            }
        }

        public function _Str_13449():void
        {
            this._Str_22223();
        }

        public function _Str_20061(vpaidMedia:_Str_5226, adSlot:AdSlot, eventCallbackFunctions:Object, muteOnStartup:Boolean=false, playerVolume:Number=-1, reduceVPAIDAdHeightByBottomMargin:Boolean=false, enableScaling:Boolean=true):void
        {
            var adIsLinear:Boolean;
            if (vpaidMedia != null)
            {
                if (((adSlot.isNonLinear()) && (enableScaling == false)))
                {
                    NonLinearVideoAd(vpaidMedia).scale = false;
                }
                adIsLinear = adSlot.isLinear();
                if (this._Str_19851())
                {
                    this._Str_22223();
                }
                this._Str_2962 = vpaidMedia;
                if (adSlot.config.vpaidMaxDurationTimeoutEnabled())
                {
                    vpaidMedia._Str_17184(adSlot.config.vpaidMaxDurationTimeout);
                    vpaidMedia.enableMaxDurationTimeout();
                }
                else
                {
                    vpaidMedia._Str_18747();
                }
                vpaidMedia._Str_18023(function (k:_Str_2291=null):void
                {
                    adSlot.actionCompanionAdStart();
                    if (eventCallbackFunctions.onStart != undefined)
                    {
                        eventCallbackFunctions.onStart(k);
                    }
                });
                vpaidMedia._Str_16112(function (k:_Str_2291=null):void
                {
                    clearOverlay(_Str_2335.config.getLinearVPAIDRegionID());
                    adSlot.actionCompanionAdEnd();
                    if (eventCallbackFunctions.onError != undefined)
                    {
                        eventCallbackFunctions.onError(k);
                    }
                });
                vpaidMedia._Str_17667(function (k:_Str_2291=null):void
                {
                    if (eventCallbackFunctions.onLog != undefined)
                    {
                        eventCallbackFunctions.onLog(k);
                    }
                    if (_Str_2335 != null)
                    {
                        if (((!(_Str_2335.config.adsConfig.vpaidConfig.terminateOnLogMessage == null)) && (!(k == null))))
                        {
                            if (k.data != null)
                            {
                                if (k.data.message == _Str_2335.config.adsConfig.vpaidConfig.terminateOnLogMessage)
                                {
                                    if (vpaidMedia.getVPAID() != null)
                                    {
                                        vpaidMedia.getVPAID().stopAd();
                                    }
                                }
                            }
                        }
                    }
                });
                vpaidMedia._Str_18005(function (k:_Str_2291=null):void
                {
                    clearOverlay(_Str_2335.config.getLinearVPAIDRegionID());
                    adSlot.actionCompanionAdEnd();
                    if (eventCallbackFunctions.onComplete != undefined)
                    {
                        eventCallbackFunctions.onComplete(k);
                    }
                });
                vpaidMedia._Str_18994(function (k:_Str_2291=null):void
                {
                    if (k != null)
                    {
                        if (_Str_2962 != null)
                        {
                            if (_Str_2962._Str_4668() != null)
                            {
                                if (adIsLinear)
                                {
                                    if ((k.data is Object))
                                    {
                                        if (((k.data.expanded == false) && (k.data.linearPlayback == false)))
                                        {
                                            _Str_2962._Str_4668().minimize();
                                        }
                                        else
                                        {
                                            _Str_2962._Str_4668().restore();
                                        }
                                    }
                                }
                                else
                                {
                                    if (NonLinearVideoAd(_Str_2962)._Str_16096())
                                    {
                                        if ((k.data is Object))
                                        {
                                            if (k.data.expanded)
                                            {
                                                _Str_2962._Str_4668().expand();
                                            }
                                            else
                                            {
                                                _Str_2962._Str_4668()._Str_23314();
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                    if (eventCallbackFunctions.onExpandedChange != undefined)
                    {
                        eventCallbackFunctions.onExpandedChange(k);
                    }
                });
                vpaidMedia._Str_16180(function (k:_Str_2291=null):void
                {
                    if (eventCallbackFunctions.onLinearChange != undefined)
                    {
                        eventCallbackFunctions.onLinearChange(k);
                    }
                });
                vpaidMedia._Str_16053(function (k:_Str_2291=null):void
                {
                    if (eventCallbackFunctions.onRemainingTimeChange != undefined)
                    {
                        eventCallbackFunctions.onRemainingTimeChange(k);
                    }
                });
                vpaidMedia._Str_16310(function (k:_Str_2291=null):void
                {
                    if (eventCallbackFunctions.onVolumeChange != undefined)
                    {
                        eventCallbackFunctions.onVolumeChange(k);
                    }
                });
                vpaidMedia._Str_18109(function (k:_Str_2291=null):void
                {
                    if (eventCallbackFunctions.onClickThru != undefined)
                    {
                        eventCallbackFunctions.onClickThru(k);
                    }
                });
                vpaidMedia._Str_16234(function (k:_Str_2291=null):void
                {
                    if (eventCallbackFunctions.onUserClose != undefined)
                    {
                        eventCallbackFunctions.onUserClose(k);
                    }
                });
                vpaidMedia._Str_17214(function (k:_Str_2291=null):void
                {
                    if (eventCallbackFunctions.onImpression != undefined)
                    {
                        eventCallbackFunctions.onImpression(k);
                    }
                });
                vpaidMedia._Str_17326(function (k:_Str_2291=null):void
                {
                    if (eventCallbackFunctions.onLoaded != undefined)
                    {
                        eventCallbackFunctions.onLoaded(k);
                    }
                });
                vpaidMedia._Str_18263(function (k:_Str_2291=null):void
                {
                    if (eventCallbackFunctions.userMinimize != undefined)
                    {
                        eventCallbackFunctions.onUserMinimize(k);
                    }
                });
                vpaidMedia._Str_17380(function (k:_Str_2291=null):void
                {
                    if (eventCallbackFunctions.onUserAcceptInvitation != undefined)
                    {
                        eventCallbackFunctions.onUserAcceptInvitation(k);
                    }
                });
                vpaidMedia._Str_17367(function (k:_Str_2291=null):void
                {
                    if (eventCallbackFunctions.onVideoAdStart != undefined)
                    {
                        eventCallbackFunctions.onVideoAdStart(k);
                    }
                });
                vpaidMedia._Str_16574(function (k:_Str_2291=null):void
                {
                    if (eventCallbackFunctions.onVideoAdFirstQuartile != undefined)
                    {
                        eventCallbackFunctions.onVideoAdFirstQuartile(k);
                    }
                });
                vpaidMedia._Str_15911(function (k:_Str_2291=null):void
                {
                    if (eventCallbackFunctions.onVideoAdMidpoint != undefined)
                    {
                        eventCallbackFunctions.onVideoAdMidpoint(k);
                    }
                });
                vpaidMedia._Str_17407(function (k:_Str_2291=null):void
                {
                    if (eventCallbackFunctions.onVideoAdThirdQuartile != undefined)
                    {
                        eventCallbackFunctions.onVideoAdThirdQuartile(k);
                    }
                });
                vpaidMedia._Str_16669(function (k:_Str_2291=null):void
                {
                    if (eventCallbackFunctions.onVideoAdComplete != undefined)
                    {
                        eventCallbackFunctions.onVideoAdComplete(k);
                    }
                });
                vpaidMedia._Str_17018(function (k:_Str_2291=null):void
                {
                    if (eventCallbackFunctions.onSkipped != undefined)
                    {
                        eventCallbackFunctions.onSkipped(k);
                    }
                });
                vpaidMedia._Str_18631(function (k:_Str_2291=null):void
                {
                    if (eventCallbackFunctions.onSkippableStateChange != undefined)
                    {
                        eventCallbackFunctions.onSkippableStateChange(k);
                    }
                });
                vpaidMedia._Str_18205(function (k:_Str_2291=null):void
                {
                    if (eventCallbackFunctions.onSizeChange != undefined)
                    {
                        eventCallbackFunctions.onSizeChange(k);
                    }
                });
                vpaidMedia._Str_17427(function (k:_Str_2291=null):void
                {
                    if (eventCallbackFunctions.onDurationChange != undefined)
                    {
                        eventCallbackFunctions.onDurationChange(k);
                    }
                });
                vpaidMedia._Str_18144(function (k:_Str_2291=null):void
                {
                    if (eventCallbackFunctions.onAdInteraction != undefined)
                    {
                        eventCallbackFunctions.onAdInteraction(k);
                    }
                });
                vpaidMedia._Str_18688(function (k:_Str_2291=null):void
                {
                });
                if (adIsLinear)
                {
                    this._Str_2962._Str_10362((_Str_3679(this._Str_2335.config.getLinearVPAIDRegionID()) as OverlayView));
                }
                else
                {
                    if (NonLinearVideoAd(vpaidMedia)._Str_16096())
                    {
                        this._Str_2962._Str_10362(this._Str_18966(adSlot, NonLinearVideoAd(vpaidMedia), "bottom", new CloseButtonConfig({"enabled":false})));
                    }
                    else
                    {
                        this._Str_2962._Str_10362((_Str_3679(this._Str_2335.config.getNonLinearVPAIDRegionID()) as OverlayView));
                    }
                }
                if (this._Str_2962._Str_4668() != null)
                {
                    if (eventCallbackFunctions.onLoading != undefined)
                    {
                        eventCallbackFunctions.onLoading();
                    }
                    this.setChildIndex(this._Str_2962._Str_4668(), (this.numChildren - 1));
                    this._Str_2962._Str_4668()._Str_5530 = adSlot;
                    this._Str_2962._Str_4668()._Str_19513((vpaidMedia as _Str_4027), this._Str_2335.config.adsConfig.vpaidConfig, this._Str_2335.config.adsConfig.allowDomains, false, muteOnStartup, reduceVPAIDAdHeightByBottomMargin, adIsLinear, playerVolume);
                }
                else
                {
                    if (eventCallbackFunctions.onError != undefined)
                    {
                        eventCallbackFunctions.onError(new _Str_2291(_Str_2291.AdError, "Could not create the overlay region"));
                    }
                }
            }
            else
            {
                if (eventCallbackFunctions.onError != undefined)
                {
                    eventCallbackFunctions.onError(new _Str_2291(_Str_2291.AdError, "Could not find a suitable Flash Ad in this Ad Slot"));
                }
            }
        }

        override public function onRegionCloseClicked(k:RegionView):void
        {
            this._Str_2335._Str_25709((k as OverlayView));
        }

        override public function onRegionClicked(k:RegionView, _arg_2:MouseEvent):void
        {
            this._Str_2335._Str_22653((k as OverlayView), _arg_2);
        }

        public function _Str_17469(k:AdSlot):void
        {
            this._Str_2335._Str_17469(k);
        }
    }
}
