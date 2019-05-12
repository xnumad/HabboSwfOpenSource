package org.openvideoads.vast.config
{
    import org.openvideoads.util.StringUtils;
    import org.openvideoads.vast.schedule.ads.templates._Str_5080;
    import org.openvideoads.vast.schedule.ads.templates._Str_4426;
    import org.openvideoads.vast.schedule.ads.templates._Str_4962;
    import org.openvideoads.vast.schedule.ads.templates._Str_5816;
    import org.openvideoads.vast.schedule.ads.templates._Str_5713;
    import org.openvideoads.vast.schedule.ads.templates._Str_5981;
    import org.openvideoads.vast.schedule.ads.templates.*;

    public class ConfigPreConverter 
    {


        public static function _Str_4080(k:Object):Object
        {
            var _local_2:Object = _Str_21599(_Str_22158(k));
            return _local_2;
        }

        public static function _Str_22158(k:Object):Object
        {
            var _local_2:String;
            var _local_3:int;
            if (k.hasOwnProperty("analytics"))
            {
                if (k.analytics.hasOwnProperty("google"))
                {
                    if (k.analytics.google.hasOwnProperty("enable"))
                    {
                        if (k.analytics.google.enable == false)
                        {
                            if (k.analytics.google.hasOwnProperty("custom"))
                            {
                                k.analytics.google.custom.enable = false;
                            }
                        }
                        delete k.analytics.google.enable;
                    }
                    if (k.analytics.google.hasOwnProperty("ova"))
                    {
                        delete k.analytics.google.ova;
                    }
                }
            }
            if (k.hasOwnProperty("overlays"))
            {
                if (k.overlays.hasOwnProperty("closeButton"))
                {
                    if (k.hasOwnProperty("regions"))
                    {
                        k.regions.closeButton = k.overlays.closeButton;
                    }
                    else
                    {
                        k.regions = {"closeButton":k.overlays.closeButton};
                    }
                }
                if (k.overlays.hasOwnProperty("regions"))
                {
                    k.regions = {"declarations":k.overlays.regions};
                }
                if (k.overlays.hasOwnProperty("stagePaddingBottomNoControls"))
                {
                    if (k.hasOwnProperty("player"))
                    {
                        if (k.player.hasOwnProperty("margins"))
                        {
                            k.player.margins.withoutControls = k.overlays.stagePaddingBottomNoControls;
                            k.player.margins.withoutControlsOverride = k.overlays.stagePaddingBottomNoControls;
                        }
                        else
                        {
                            k.player.margins = {
                                "withoutControls":k.overlays.stagePaddingBottomNoControls,
                                "withoutControlsOverride":k.overlays.stagePaddingBottomNoControls
                            }
                        }
                    }
                    else
                    {
                        k.player = {"margins":{
                                "withoutControls":k.overlays.stagePaddingBottomNoControls,
                                "withoutControlsOverride":k.overlays.stagePaddingBottomNoControls
                            }};
                    }
                }
                if (k.overlays.hasOwnProperty("stagePaddingBottomWithControls"))
                {
                    if (k.hasOwnProperty("player"))
                    {
                        if (k.player.hasOwnProperty("margins"))
                        {
                            k.player.margins.withControls = k.overlays.stagePaddingBottomWithControls;
                            k.player.margins.withControlsOverride = k.overlays.stagePaddingBottomWithControls;
                        }
                        else
                        {
                            k.player.margins = {
                                "withControls":k.overlays.stagePaddingBottomWithControls,
                                "withControlsOverride":k.overlays.stagePaddingBottomWithControls
                            }
                        }
                    }
                    else
                    {
                        k.player = {"margins":{
                                "withControls":k.overlays.stagePaddingBottomWithControls,
                                "withControlsOverride":k.overlays.stagePaddingBottomWithControls
                            }};
                    }
                }
            }
            if (k.hasOwnProperty("ads"))
            {
                if (k.ads.hasOwnProperty("replayNonLinearAds"))
                {
                    if (k.ads.hasOwnProperty("overlays"))
                    {
                        k.ads.overlays.replay = k.ads.replayNonLinearAds;
                    }
                    else
                    {
                        k.ads.overlays = {"replay":k.ads.replayNonLinearAds};
                    }
                }
                if (k.ads.hasOwnProperty("acceptedNonLinearAdMimeTypes"))
                {
                    if (k.ads.hasOwnProperty("overlays"))
                    {
                        k.ads.overlays.acceptedMimeTypes = k.ads.acceptedNonLinearAdMimeTypes;
                    }
                    else
                    {
                        k.ads.overlays = {"acceptedMimeTypes":k.ads.acceptedNonLinearAdMimeTypes};
                    }
                }
                if (k.ads.hasOwnProperty("enableOverlayScaling"))
                {
                    if (k.ads.hasOwnProperty("overlays"))
                    {
                        k.ads.overlays.enableScaling = k.ads.enableOverlayScaling;
                    }
                    else
                    {
                        k.ads.overlays = {"enableScaling":k.ads.enableOverlayScaling};
                    }
                }
                if (k.ads.hasOwnProperty("enforceOverlayRecommendedSizing"))
                {
                    if (k.ads.hasOwnProperty("overlays"))
                    {
                        k.ads.overlays.enforceRecommendedSizing = k.ads.enforceOverlayRecommendedSizing;
                    }
                    else
                    {
                        k.ads.overlays = {"enforceRecommendedSizing":k.ads.enforceOverlayRecommendedSizing};
                    }
                }
                if (k.ads.hasOwnProperty("keepOverlayVisibleAfterClick"))
                {
                    if (k.ads.hasOwnProperty("overlays"))
                    {
                        k.ads.overlays.keepVisibleAfterClick = k.ads.keepOverlayVisibleAfterClick;
                    }
                    else
                    {
                        k.ads.overlays = {"keepVisibleAfterClick":k.ads.keepOverlayVisibleAfterClick};
                    }
                }
                if (k.ads.hasOwnProperty("companions"))
                {
                    if ((k.ads.companions is Array))
                    {
                        k.ads.companions = {"regions":k.ads.companions};
                    }
                }
                if (k.ads.hasOwnProperty("processCompanionsExternally"))
                {
                    if (k.ads.hasOwnProperty("companions"))
                    {
                        k.ads.companions.html5 = k.ads.processCompanionsExternally;
                    }
                }
                if (k.ads.hasOwnProperty("millisecondDelayOnCompanionInjection"))
                {
                    if (k.ads.hasOwnProperty("companions"))
                    {
                        k.ads.companions.millisecondDelayOnInjection = k.ads.millisecondDelayOnCompanionInjection;
                    }
                }
                if (k.ads.hasOwnProperty("displayCompanions"))
                {
                    if (k.ads.hasOwnProperty("companions"))
                    {
                        k.ads.companions.enable = k.ads.displayCompanions;
                    }
                }
                if (k.ads.hasOwnProperty("restoreCompanions"))
                {
                    if (k.ads.hasOwnProperty("companions"))
                    {
                        k.ads.companions.restore = k.ads.restoreCompanions;
                    }
                }
                if (k.ads.hasOwnProperty("additionalParamsForSWFCompanions"))
                {
                    if (k.ads.hasOwnProperty("companions"))
                    {
                        k.ads.companions.additionalParamsForSWFCompanions = k.ads.additionalParamsForSWFCompanions;
                    }
                }
                if (k.ads.hasOwnProperty("controls"))
                {
                    if (k.ads.controls.hasOwnProperty("skipAd"))
                    {
                        k.ads.skipAd = k.ads.controls.skipAd;
                    }
                    else
                    {
                        if (k.hasOwnProperty("player") == false)
                        {
                            k.player = {"modes":{"linear":{"controls":k.ads.controls}}};
                        }
                        else
                        {
                            if (k.player.hasOwnProperty("modes") == false)
                            {
                                k.player.modes = {"linear":{"controls":k.ads.controls}};
                            }
                            else
                            {
                                if (k.player.modes.hasOwnProperty("linear") == false)
                                {
                                    k.player.modes.linear = {"controls":k.ads.controls};
                                }
                                else
                                {
                                    if (k.player.modes.linear.hasOwnProperty("controls") == false)
                                    {
                                        k.player.modes.linear.controls = k.ads.controls;
                                    }
                                    else
                                    {
                                        for (_local_2 in k.ads.controls)
                                        {
                                            if (_local_2 == "skipAd")
                                            {
                                                k.ads.skipAd = _local_2;
                                            }
                                            else
                                            {
                                                k.player.modes.linear.controls[_local_2] = k.ads.controls[_local_2];
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                else
                {
                    if (k.ads.hasOwnProperty("vpaid"))
                    {
                        if (k.ads.vpaid.hasOwnProperty("controls"))
                        {
                            if (k.ads.vpaid.controls.hasOwnProperty("hideOnLinearPlayback"))
                            {
                                if (k.hasOwnProperty("player") == false)
                                {
                                    k.player = {"modes":{"linear":{"controls":{"vpaid":{"visible":(!(k.ads.vpaid.controls.hideOnLinearPlayback))}}}}};
                                }
                                else
                                {
                                    if (k.player.hasOwnProperty("modes") == false)
                                    {
                                        k.player.modes = {"linear":{"controls":{"vpaid":{"visible":(!(k.ads.vpaid.controls.hideOnLinearPlayback))}}}};
                                    }
                                    else
                                    {
                                        if (k.player.modes.hasOwnProperty("linear") == false)
                                        {
                                            k.player.modes.linear = {"controls":{"vpaid":{"visible":(!(k.ads.vpaid.controls.hideOnLinearPlayback))}}};
                                        }
                                        else
                                        {
                                            if (k.player.modes.linear.hasOwnProperty("controls") == false)
                                            {
                                                k.player.modes.linear.controls = {"vpaid":{"visible":(!(k.ads.vpaid.controls.hideOnLinearPlayback))}};
                                            }
                                            else
                                            {
                                                if (k.player.modes.linear.controls.hasOwnProperty("vpaid") == false)
                                                {
                                                    k.player.modes.linear.controls.vpaid = {"visible":(!(k.ads.vpaid.controls.hideOnLinearPlayback))};
                                                }
                                                else
                                                {
                                                    k.player.modes.linear.controls.vpaid.visible = (!(k.ads.vpaid.controls.hideOnLinearPlayback));
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                if (k.ads.hasOwnProperty("disableControls"))
                {
                    if (k.hasOwnProperty("player") == false)
                    {
                        k.player = {"modes":{"linear":{"controls":{"enable":(!(k.ads.disableControls))}}}};
                    }
                    else
                    {
                        if (k.player.hasOwnProperty("modes") == false)
                        {
                            k.player.modes = {"linear":{"controls":{"enable":(!(k.ads.disableControls))}}};
                        }
                        else
                        {
                            if (k.player.modes.hasOwnProperty("linear") == false)
                            {
                                k.player.modes.linear = {"controls":{"enable":(!(k.ads.disableControls))}};
                            }
                            else
                            {
                                if (k.player.modes.linear.hasOwnProperty("controls") == false)
                                {
                                    k.player.modes.linear.controls = {"enable":(!(k.ads.disableControls))};
                                }
                                else
                                {
                                    if (k.player.modes.linear.hasOwnProperty("enable") == false)
                                    {
                                        k.player.modes.linear.controls.enable = (!(k.ads.disableControls));
                                    }
                                }
                            }
                        }
                    }
                }
                if (k.ads.hasOwnProperty("schedule"))
                {
                    if ((k.ads.schedule is Array))
                    {
                        _local_3 = 0;
                        while (_local_3 < k.ads.schedule.length)
                        {
                            if (k.ads.schedule[_local_3].hasOwnProperty("position"))
                            {
                                if ((k.ads.schedule[_local_3].position is String))
                                {
                                    if (StringUtils._Str_22149("PRE-ROLL MID-ROLL POST-ROLL", k.ads.schedule[_local_3].position) == false)
                                    {
                                        k.ads.schedule[_local_3].region = k.ads.schedule[_local_3].position;
                                        delete k.ads.schedule[_local_3].position;
                                    }
                                }
                            }
                            _local_3++;
                        }
                    }
                }
            }
            return k;
        }

        protected static function _Str_9558(k:Object):Object
        {
            var _local_2:Object;
            var _local_3:String;
            if ((k is String))
            {
                return ({
                    "image":k,
                    "text":k,
                    "html":k,
                    "swf":k,
                    "vpaid":k,
                    "iframe":k,
                    "script":k
                });
            }
            _local_2 = {
                "image":"auto:bottom",
                "text":"auto:bottom",
                "html":"auto:bottom",
                "swf":"auto:bottom",
                "vpaid":"auto:bottom",
                "iframe":"auto:bottom",
                "script":"auto:bottom"
            }
            if (k != null)
            {
                for (_local_3 in k)
                {
                    _local_2[_local_3] = k[_local_3];
                }
            }
            return _local_2;
        }

        protected static function _Str_6379(k:String, _arg_2:Object=null):Object
        {
            var _local_4:String;
            var _local_3:Object = {
                "text":new _Str_5080(k),
                "html":new _Str_4426(k),
                "image":new _Str_4962(k),
                "swf":new _Str_5816(k),
                "script":new _Str_5713(k),
                "iframe":new _Str_5981(k),
                "vpaid":null
            }
            if (_arg_2 != null)
            {
                for (_local_4 in _arg_2)
                {
                    if (StringUtils._Str_2576(_local_4, "text"))
                    {
                        _local_3[_local_4] = new _Str_5080(k, _arg_2[_local_4]);
                    }
                    else
                    {
                        if (StringUtils._Str_2576(_local_4, "html"))
                        {
                            _local_3[_local_4] = new _Str_4426(k, _arg_2[_local_4]);
                        }
                        else
                        {
                            if (StringUtils._Str_2576(_local_4, "image"))
                            {
                                _local_3[_local_4] = new _Str_4962(k, _arg_2[_local_4]);
                            }
                            else
                            {
                                if (StringUtils._Str_2576(_local_4, "swf"))
                                {
                                    _local_3[_local_4] = new _Str_5816(k, _arg_2[_local_4]);
                                }
                                else
                                {
                                    if (StringUtils._Str_2576(_local_4, "script"))
                                    {
                                        _local_3[_local_4] = new _Str_5713(k, _arg_2[_local_4]);
                                    }
                                    else
                                    {
                                        if (StringUtils._Str_2576(_local_4, "iframe"))
                                        {
                                            _local_3[_local_4] = new _Str_5981(k, _arg_2[_local_4]);
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            return _local_3;
        }

        public static function _Str_21599(k:Object):Object
        {
            var _local_2:Object;
            var _local_3:int;
            var _local_4:String;
            var _local_5:int;
            var _local_6:int;
            if (k.hasOwnProperty("ads"))
            {
                _local_2 = ((k.ads.hasOwnProperty("overlays")) ? k.ads.overlays : new Object());
                if (_local_2.hasOwnProperty("regions") == false)
                {
                    if (_local_2.hasOwnProperty("region"))
                    {
                        _local_2.regions = {
                            "preferred":"flash",
                            "flash":[{
                                "enable":true,
                                "region":_local_2.region
                            }],
                            "html5":[{
                                "enable":false,
                                "region":_local_2.region
                            }]
                        }
                        delete _local_2.region;
                    }
                    else
                    {
                        _local_2.regions = {
                            "preferred":"flash",
                            "flash":[{"enable":true}],
                            "html5":[{"enable":false}]
                        }
                    }
                }
                else
                {
                    if (_local_2.regions.hasOwnProperty("preferred") == false)
                    {
                        _local_2.regions.preferred = "flash";
                    }
                    if (_local_2.regions.hasOwnProperty("flash") == false)
                    {
                        _local_2.regions.flash = [{"enable":true}];
                    }
                    else
                    {
                        if (((_local_2.regions.flash is String) || (_local_2.regions.flash is Boolean)))
                        {
                            _local_2.regions.flash = [{"enable":StringUtils._Str_2810(_local_2.regions.flash)}];
                        }
                        else
                        {
                            if ((_local_2.regions.flash is Array))
                            {
                            }
                        }
                    }
                    if (_local_2.regions.hasOwnProperty("html5") == false)
                    {
                        _local_2.regions.html5 = [{"enable":false}];
                    }
                    else
                    {
                        if ((_local_2.regions.html5 is Array) == false)
                        {
                            _local_2.regions.html5 = [{"enable":StringUtils._Str_2810(_local_2.regions.html5)}];
                        }
                    }
                }
                if (k.ads.hasOwnProperty("schedule"))
                {
                    if ((k.ads.schedule is Array))
                    {
                        _local_3 = 0;
                        while (_local_3 < k.ads.schedule.length)
                        {
                            if (k.ads.schedule[_local_3].hasOwnProperty("startTime"))
                            {
                                if (k.ads.schedule[_local_3].hasOwnProperty("regions") == false)
                                {
                                    if (k.ads.schedule[_local_3].hasOwnProperty("region"))
                                    {
                                        k.ads.schedule[_local_3].regions = {
                                            "preferred":_local_2.regions.preferred,
                                            "flash":[{
                                                "enable":_local_2.regions.flash[0].enable,
                                                "region":k.ads.schedule[_local_3].region,
                                                "overlay":true
                                            }],
                                            "html5":[{
                                                "enable":_local_2.regions.html5[0].enable,
                                                "region":k.ads.schedule[_local_3].region,
                                                "overlay":true
                                            }]
                                        }
                                    }
                                    else
                                    {
                                        k.ads.schedule[_local_3].regions = _local_2.regions;
                                    }
                                }
                                if (k.ads.schedule[_local_3].regions.hasOwnProperty("preferred") == false)
                                {
                                    k.ads.schedule[_local_3].regions.preferred = "flash";
                                }
                                if (k.ads.schedule[_local_3].regions.hasOwnProperty("flash") == false)
                                {
                                    if (k.ads.schedule[_local_3].hasOwnProperty("region"))
                                    {
                                        k.ads.schedule[_local_3].regions.flash = [{
                                            "enable":_local_2.regions.flash[0].enable,
                                            "region":k.ads.schedule[_local_3].region,
                                            "overlay":true
                                        }];
                                    }
                                    else
                                    {
                                        k.ads.schedule[_local_3].regions.flash = [{
                                            "enable":_local_2.regions.flash[0].enable,
                                            "overlay":true
                                        }];
                                    }
                                }
                                else
                                {
                                    if ((k.ads.schedule[_local_3].regions.flash is Array) == false)
                                    {
                                        k.ads.schedule[_local_3].regions.flash = [{
                                            "enable":StringUtils._Str_2810(k.ads.schedule[_local_3].regions.flash),
                                            "overlay":true
                                        }];
                                    }
                                }
                                if (k.ads.schedule[_local_3].regions.hasOwnProperty("html5") == false)
                                {
                                    if (k.ads.schedule[_local_3].hasOwnProperty("region"))
                                    {
                                        k.ads.schedule[_local_3].regions.html5 = [{
                                            "enable":_local_2.regions.html5[0].enable,
                                            "region":k.ads.schedule[_local_3].region,
                                            "overlay":true
                                        }];
                                    }
                                    else
                                    {
                                        k.ads.schedule[_local_3].regions.html5 = [{
                                            "enable":_local_2.regions.html5[0].enable,
                                            "overlay":true
                                        }];
                                    }
                                }
                                else
                                {
                                    if ((k.ads.schedule[_local_3].regions.html5 is Array) == false)
                                    {
                                        k.ads.schedule[_local_3].regions.html5 = [{
                                            "enable":StringUtils._Str_2810(k.ads.schedule[_local_3].regions.html5),
                                            "overlay":true
                                        }];
                                    }
                                }
                                _local_4 = "flash";
                                _local_5 = 0;
                                while (_local_5 < 2)
                                {
                                    _local_6 = 0;
                                    while (_local_6 < k.ads.schedule[_local_3].regions[_local_4].length)
                                    {
                                        if (k.ads.schedule[_local_3].regions[_local_4][_local_6].hasOwnProperty("region"))
                                        {
                                            k.ads.schedule[_local_3].regions[_local_4][_local_6].region = _Str_9558(k.ads.schedule[_local_3].regions[_local_4][_local_6].region);
                                        }
                                        else
                                        {
                                            if (k.ads.schedule[_local_3].regions.hasOwnProperty("region"))
                                            {
                                                if (k.ads.schedule[_local_3].hasOwnProperty("region"))
                                                {
                                                    k.ads.schedule[_local_3].regions[_local_4][_local_6].region = _Str_9558(k.ads.schedule[_local_3].region);
                                                }
                                            }
                                            else
                                            {
                                                if (k.ads.hasOwnProperty("overlays"))
                                                {
                                                    if (k.ads.overlays.hasOwnProperty("region"))
                                                    {
                                                        k.ads.schedule[_local_3].regions[_local_4][_local_6].region = _Str_9558(k.ads.overlays.region);
                                                    }
                                                }
                                            }
                                        }
                                        if (k.ads.schedule[_local_3].hasOwnProperty("templates"))
                                        {
                                            k.ads.schedule[_local_3].regions[_local_4][_local_6].templates = _Str_6379(_local_4, k.ads.schedule[_local_3].templates);
                                        }
                                        else
                                        {
                                            if (k.ads.hasOwnProperty("overlays"))
                                            {
                                                if (k.ads.overlays.hasOwnProperty("templates"))
                                                {
                                                    k.ads.schedule[_local_3].regions[_local_4][_local_6].templates = _Str_6379(_local_4, k.ads.overlays.templates);
                                                }
                                                else
                                                {
                                                    k.ads.schedule[_local_3].regions[_local_4][_local_6].templates = _Str_6379(_local_4);
                                                }
                                            }
                                            else
                                            {
                                                k.ads.schedule[_local_3].regions[_local_4][_local_6].templates = _Str_6379(_local_4);
                                            }
                                        }
                                        if (k.ads.schedule[_local_3].hasOwnProperty("width"))
                                        {
                                            k.ads.schedule[_local_3].regions[_local_4][_local_6].width = k.ads.schedule[_local_3].width;
                                        }
                                        else
                                        {
                                            if (k.ads.hasOwnProperty("overlays"))
                                            {
                                                if (k.ads.overlays.hasOwnProperty("width"))
                                                {
                                                    k.ads.schedule[_local_3].regions[_local_4][_local_6].width = k.ads.overlays.width;
                                                }
                                            }
                                        }
                                        if (k.ads.schedule[_local_3].hasOwnProperty("height"))
                                        {
                                            k.ads.schedule[_local_3].regions[_local_4][_local_6].height = k.ads.schedule[_local_3].height;
                                        }
                                        else
                                        {
                                            if (k.ads.hasOwnProperty("overlays"))
                                            {
                                                if (k.ads.overlays.hasOwnProperty("height"))
                                                {
                                                    k.ads.schedule[_local_3].regions[_local_4][_local_6].height = k.ads.overlays.height;
                                                }
                                            }
                                        }
                                        if (k.ads.schedule[_local_3].hasOwnProperty("acceptedAdTypes"))
                                        {
                                            k.ads.schedule[_local_3].regions[_local_4][_local_6].acceptedAdTypes = k.ads.schedule[_local_3].acceptedAdTypes;
                                        }
                                        else
                                        {
                                            if (k.ads.hasOwnProperty("overlays"))
                                            {
                                                if (k.ads.overlays.hasOwnProperty("acceptedAdTypes"))
                                                {
                                                    k.ads.schedule[_local_3].regions[_local_4][_local_6].acceptedAdTypes = k.ads.overlays.acceptedAdTypes;
                                                }
                                            }
                                        }
                                        if (k.ads.schedule[_local_3].hasOwnProperty("alwaysMatch"))
                                        {
                                            k.ads.schedule[_local_3].regions[_local_4][_local_6].alwaysMatch = k.ads.schedule[_local_3].alwaysMatch;
                                        }
                                        else
                                        {
                                            if (k.ads.hasOwnProperty("overlays"))
                                            {
                                                if (k.ads.overlays.hasOwnProperty("alwaysMatch"))
                                                {
                                                    k.ads.schedule[_local_3].regions[_local_4][_local_6].alwaysMatch = k.ads.overlays.alwaysMatch;
                                                }
                                            }
                                        }
                                        if (k.ads.schedule[_local_3].hasOwnProperty("enableScaling"))
                                        {
                                            k.ads.schedule[_local_3].regions[_local_4][_local_6].enableScaling = k.ads.schedule[_local_3].enableScaling;
                                        }
                                        else
                                        {
                                            if (k.ads.hasOwnProperty("overlays"))
                                            {
                                                if (k.ads.overlays.hasOwnProperty("enableScaling"))
                                                {
                                                    k.ads.schedule[_local_3].regions[_local_4][_local_6].enableScaling = k.ads.overlays.enableScaling;
                                                }
                                            }
                                        }
                                        if (k.ads.schedule[_local_3].hasOwnProperty("enforceRecommendedSizing"))
                                        {
                                            k.ads.schedule[_local_3].regions[_local_4][_local_6].enforceRecommendedSizing = k.ads.schedule[_local_3].enforceRecommendedSizing;
                                        }
                                        else
                                        {
                                            if (k.ads.hasOwnProperty("overlays"))
                                            {
                                                if (k.ads.overlays.hasOwnProperty("enforceRecommendedSizing"))
                                                {
                                                    k.ads.schedule[_local_3].regions[_local_4][_local_6].enforceRecommendedSizing = k.ads.overlays.enforceRecommendedSizing;
                                                }
                                            }
                                        }
                                        if (k.ads.schedule[_local_3].hasOwnProperty("keepVisibleAfterClick"))
                                        {
                                            k.ads.schedule[_local_3].regions[_local_4][_local_6].keepVisibleAfterClick = k.ads.schedule[_local_3].keepVisibleAfterClick;
                                        }
                                        else
                                        {
                                            if (k.ads.hasOwnProperty("overlays"))
                                            {
                                                if (k.ads.overlays.hasOwnProperty("keepVisibleAfterClick"))
                                                {
                                                    k.ads.schedule[_local_3].regions[_local_4][_local_6].keepVisibleAfterClick = k.ads.overlays.keepVisibleAfterClick;
                                                }
                                            }
                                        }
                                        if (_local_4 == "html5")
                                        {
                                            if (k.ads.schedule[_local_3].hasOwnProperty("overlay"))
                                            {
                                                if ((k.ads.schedule[_local_3].overlay is Boolean))
                                                {
                                                    k.ads.schedule[_local_3].regions[_local_4][_local_6].overlay = k.ads.schedule[_local_3].overlay;
                                                }
                                                else
                                                {
                                                    if ((k.ads.schedule[_local_3].overlay is Object))
                                                    {
                                                        if (k.ads.schedule[_local_3].overlay.hasOwnProperty("html5"))
                                                        {
                                                            k.ads.schedule[_local_3].regions[_local_4][_local_6].overlay = k.ads.schedule[_local_3].overlay.html5;
                                                        }
                                                    }
                                                }
                                            }
                                            else
                                            {
                                                if (k.ads.hasOwnProperty("overlays"))
                                                {
                                                    if (k.ads.overlays.hasOwnProperty("overlay"))
                                                    {
                                                        if ((k.ads.overlays.overlay is Boolean))
                                                        {
                                                            k.ads.schedule[_local_3].regions[_local_4][_local_6].overlay = k.ads.overlays..overlay;
                                                        }
                                                        else
                                                        {
                                                            if ((k.ads.overlays.overlay is Object))
                                                            {
                                                                if (k.ads.overlays.overlay.hasOwnProperty("html5"))
                                                                {
                                                                    k.ads.schedule[_local_3].regions[_local_4][_local_6].overlay = k.ads.overlays.overlay.html5;
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                                else
                                                {
                                                    if (k.ads.schedule[_local_3].regions[_local_4][_local_6].hasOwnProperty("overlay") == false)
                                                    {
                                                        k.ads.schedule[_local_3].regions[_local_4][_local_6].overlay = true;
                                                    }
                                                }
                                            }
                                        }
                                        else
                                        {
                                            k.ads.schedule[_local_3].regions[_local_4][_local_6].overlay = true;
                                        }
                                        _local_6++;
                                    }
                                    _local_4 = "html5";
                                    _local_5++;
                                }
                            }
                            _local_3++;
                        }
                    }
                }
            }
            return k;
        }
    }
}
