package com.sulake.core.window.components
{
    import com.sulake.core.window.theme.PropertyKeys;
    import flash.text.StyleSheet;
    import flash.text.TextFieldType;
    import com.sulake.core.window.WindowContext;
    import flash.geom.Rectangle;
    import com.sulake.core.window.IWindow;
    import flash.net.URLRequest;
    import flash.external.ExternalInterface;
    import flash.net.navigateToURL;
    import com.sulake.core.window.enum.LinkTarget;
    import flash.events.TextEvent;
    import com.sulake.core.window.events.WindowLinkEvent;
    import com.sulake.core.runtime.events.ILinkEventTracker;
    import flash.events.Event;
    import com.sulake.core.window.utils.PropertyStruct;

    public class HTMLTextController extends TextFieldController implements IHTMLTextWindow 
    {
        private static const HTML_STYLESHEET_KEY:String = "html_stylesheet";
        private static var _Str_8402:String = PropertyKeys.HTML_LINK_TARGET_VALUE;

        private var _Str_9241:String;
        private var _Str_10277:String = null;
        private var _Str_5143:StyleSheet = null;

        public function HTMLTextController(k:String, _arg_2:uint, _arg_3:uint, _arg_4:uint, _arg_5:WindowContext, _arg_6:Rectangle, _arg_7:IWindow, _arg_8:Function, _arg_9:Array=null, _arg_10:Array=null, _arg_11:uint=0)
        {
            this._Str_9241 = PropertyKeys.HTML_LINK_TARGET_VALUE;
            super(k, _arg_2, _arg_3, _arg_4, _arg_5, _arg_6, _arg_7, _arg_8, _arg_9, _arg_10, _arg_11);
            this.immediateClickMode = true;
            _Str_2309.type = TextFieldType.DYNAMIC;
            _Str_2309.mouseEnabled = true;
            _Str_2309.selectable = false;
            _Str_2309.mouseWheelEnabled = true;
        }

        public static function set _Str_16826(k:String):void
        {
            _Str_8402 = k;
        }

        public static function get _Str_16826():String
        {
            return _Str_8402;
        }

        private static function _Str_20267(k:HTMLTextController, _arg_2:String):void
        {
            var _local_3:StyleSheet;
            if (k == null)
            {
                return;
            }
            if (k._Str_10277 == _arg_2)
            {
                return;
            }
            k._Str_10277 = _arg_2;
            k._Str_5143 = null;
            if (k._Str_10277 != null)
            {
                _local_3 = new StyleSheet();
                _local_3.parseCSS(k._Str_10277);
                k._Str_5143 = _local_3;
            }
        }

        private static function _Str_8814(k:String):String
        {
            var _local_2:RegExp;
            _local_2 = /<a[^>]+(http:\/\/[^"']+)['"][^>]*>(.*)<\/a>/gi;
            k = k.replace(_local_2, "<a href='event:$1'>$2</a>");
            _local_2 = /<a[^>]+(https:\/\/[^"']+)['"][^>]*>(.*)<\/a>/gi;
            k = k.replace(_local_2, "<a href='event:$1'>$2</a>");
            return k;
        }

        private static function _Str_2178(url:String, target:String):void
        {
            var userAgent:String;
            var request:URLRequest;
            var result:* = undefined;
            if (target == null)
            {
                target = _Str_8402;
            }
            if (ExternalInterface.available)
            {
                try
                {
                    userAgent = String(ExternalInterface.call("function() { return navigator.userAgent; }")).toLowerCase();
                }
                catch(e:Error)
                {
                    userAgent = "";
                }
                if (((((userAgent.indexOf("safari") > -1) || (userAgent.indexOf("chrome") > -1)) || (userAgent.indexOf("firefox") > -1)) || ((userAgent.indexOf("msie") > -1) && (uint(userAgent.substr((userAgent.indexOf("msie") + 5), 3)) >= 7))))
                {
                    try
                    {
                        result = ExternalInterface.call((((("function() {var win = window.open('" + url) + "', '") + target) + "'); if (win) { win.focus();} return true; }"));
                    }
                    catch(e:Error)
                    {
                    }
                    if (result)
                    {
                        return;
                    }
                }
                request = new URLRequest(url);
                navigateToURL(request, target);
            }
        }


        public function set linkTarget(k:String):void
        {
            if (PropertyKeys.HTML_LINK_TARGET_RANGE.indexOf(k) > -1)
            {
                this._Str_9241 = k;
            }
        }

        public function get linkTarget():String
        {
            return (this._Str_9241 == LinkTarget.DEFAULT) ? _Str_16826 : this._Str_9241;
        }

        public function get _Str_21424():String
        {
            return this._Str_10277;
        }

        public function set _Str_21424(k:String):void
        {
            _Str_20267(this, k);
        }

        override public function set immediateClickMode(k:Boolean):void
        {
            if (((k == _Str_9238) || (_Str_2309 == null)))
            {
                return;
            }
            super.immediateClickMode = k;
            if (_Str_9238)
            {
                _Str_2309.addEventListener(TextEvent.LINK, this.immediateClickHandler);
            }
            else
            {
                _Str_2309.removeEventListener(TextEvent.LINK, this.immediateClickHandler);
            }
        }

        override public function set text(k:String):void
        {
            if (k == null)
            {
                return;
            }
            if (_Str_2959)
            {
                context.removeLocalizationListener(_caption.slice(2, _caption.indexOf("}")), this);
                _Str_2959 = false;
            }
            _caption = k;
            if (((_caption.charAt(0) == "$") && (_caption.charAt(1) == "{")))
            {
                context.registerLocalizationListener(_caption.slice(2, _caption.indexOf("}")), this);
                _Str_2959 = true;
            }
            else
            {
                if (_Str_2309 != null)
                {
                    _Str_2309.htmlText = _Str_8814(_caption);
                    refreshTextImage();
                }
            }
        }

        override public function set localization(k:String):void
        {
            if (((!(k == null)) && (!(_Str_2309 == null))))
            {
                _Str_2309.htmlText = _Str_8027(_Str_8814(k));
                refreshTextImage();
            }
        }

        override public function set htmlText(k:String):void
        {
            if (k == null)
            {
                return;
            }
            if (_Str_2959)
            {
                context.removeLocalizationListener(_caption.slice(2, _caption.indexOf("}")), this);
                _Str_2959 = false;
            }
            _caption = k;
            if (((_caption.charAt(0) == "$") && (_caption.charAt(1) == "{")))
            {
                context.registerLocalizationListener(_caption.slice(2, _caption.indexOf("}")), this);
                _Str_2959 = true;
            }
            else
            {
                if (_Str_2309 != null)
                {
                    _Str_2309.htmlText = _Str_8814(_caption);
                    _Str_2309.styleSheet = this._Str_5143;
                    refreshTextImage();
                }
            }
        }

        override protected function immediateClickHandler(k:Event):void
        {
            var _local_2:WindowLinkEvent;
            var _local_3:Boolean;
            var _local_4:ILinkEventTracker;
            if ((k is TextEvent))
            {
                _local_2 = (WindowLinkEvent.allocate(TextEvent(k).text, this, null) as WindowLinkEvent);
                if (_Str_759)
                {
                    _Str_759.dispatchEvent(_local_2);
                }
                _local_3 = false;
                for each (_local_4 in _context.linkEventTrackers)
                {
                    if (_local_4.eventUrlPrefix.length > 0)
                    {
                        if (_local_2.link.substr(0, _local_4.eventUrlPrefix.length) == _local_4.eventUrlPrefix)
                        {
                            _local_4.linkReceived(_local_2.link);
                            _local_3 = true;
                        }
                    }
                    else
                    {
                        _local_4.linkReceived(_local_2.link);
                    }
                }
                if (!_local_2.isWindowOperationPrevented())
                {
                    if (procedure != null)
                    {
                        procedure(_local_2, this);
                    }
                }
                if ((((!(_local_3)) && (!(_local_2.isWindowOperationPrevented()))) && (!(this.linkTarget == LinkTarget.INTERNAL))))
                {
                    _Str_2178(TextEvent(k).text, this.linkTarget);
                }
                k.stopImmediatePropagation();
                _local_2.recycle();
            }
            else
            {
                super.immediateClickHandler(k);
            }
        }

        override public function get properties():Array
        {
            var k:Array = InteractiveController._Str_8987(this, super.properties);
            k.push(createProperty(PropertyKeys.EDITABLE, (_Str_2309.type == TextFieldType.INPUT)));
            k.push(createProperty(PropertyKeys.FOCUS_CAPTURER, _Str_9948));
            k.push(createProperty(PropertyKeys.SELECTABLE, _Str_2309.selectable));
            k.push(createProperty(PropertyKeys.DISPLAY_AS_PASSWORD, _Str_2309.displayAsPassword));
            k.push(createProperty(PropertyKeys.DISPLAY_RAW, _Str_5517));
            k.push(createProperty(PropertyKeys.LINK_TARGET, this._Str_9241));
            return k;
        }

        override public function set properties(k:Array):void
        {
            var _local_2:PropertyStruct;
            for each (_local_2 in k)
            {
                switch (_local_2.key)
                {
                    case PropertyKeys.LINK_TARGET:
                        this._Str_9241 = (_local_2.value as String);
                        break;
                    case HTML_STYLESHEET_KEY:
                        this._Str_21424 = (_local_2.value as String);
                        break;
                }
            }
            super.properties = k;
        }
    }
}
