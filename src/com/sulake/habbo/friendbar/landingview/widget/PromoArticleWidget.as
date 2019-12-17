package com.sulake.habbo.friendbar.landingview.widget
{
    import com.sulake.habbo.friendbar.landingview.interfaces.ILandingViewWidget;
    import com.sulake.habbo.friendbar.landingview.interfaces.ISettingsAwareWidget;
    import com.sulake.core.runtime.IUpdateReceiver;
    import com.sulake.habbo.friendbar.landingview.HabboLandingView;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.landingview._Str_9504;
    import com.sulake.habbo.communication.messages.outgoing._Str_551._Str_12132;
    import com.sulake.core.window.IWindow;
    import com.sulake.habbo.friendbar.landingview.layout._Str_3695;
    import com.sulake.habbo.friendbar.landingview.layout._Str_3198;
    import com.sulake.habbo.communication.messages.incoming.landingview._Str_4053;
    import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
    import com.sulake.core.window.components.IRegionWindow;
    import com.sulake.habbo.utils.HabboWebTools;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.events.WindowEvent;

    public class PromoArticleWidget implements ILandingViewWidget, ISettingsAwareWidget, IUpdateReceiver 
    {
        private static const _Str_3981:Number = ((10 * 60) * 1000);//600000
        private static const _Str_6534:Number = 500;
        private static const _Str_18540:int = 10;

        private var _landingView:HabboLandingView;
        private var _container:IWindowContainer;
        private var _currentArticle:int = 0;
        private var _articles:Array;
        private var _lastRequestTime:Date;
        private var _articlesListener:IMessageEvent;
        private var _fadePhase:uint = 0;

        public function PromoArticleWidget(k:HabboLandingView)
        {
            this._articles = [];
            super();
            this._landingView = k;
        }

        public function initialize():void
        {
            this._container = IWindowContainer(this._landingView.getXmlWindow("promo_article"));
            this._container.procedure = this._Str_22952;
            this._articlesListener = new _Str_9504(this._Str_25476);
            this._landingView.communicationManager.addHabboConnectionMessageEvent(this._articlesListener);
        }

        public function refresh():void
        {
            if (((this._lastRequestTime == null) || ((this._lastRequestTime.time + _Str_3981) < new Date().time)))
            {
                this._landingView.send(new _Str_12132());
                this._lastRequestTime = new Date();
            }
            else
            {
                this._Str_21361(this._currentArticle);
            }
        }

        public function get container():IWindow
        {
            return this._container;
        }

        public function dispose():void
        {
            if (((this._articlesListener) && (this._landingView)))
            {
                this._landingView.communicationManager.removeHabboConnectionMessageEvent(this._articlesListener);
                this._articlesListener.dispose();
                this._articlesListener = null;
            }
            if (this._container)
            {
                this._container.dispose();
                this._container = null;
            }
            this._landingView = null;
        }

        public function get disposed():Boolean
        {
            return this._landingView == null;
        }

        public function set settings(k:_Str_3198):void
        {
            _Str_3695._Str_5630(this._container, k);
        }

        private function refreshContent():void
        {
            this._Str_24669();
            this._Str_23645();
        }

        private function _Str_24669():void
        {
            var article:_Str_4053;
            article = this._articles[this._currentArticle];
            if (article)
            {
                this._container.findChildByName("promo_title").caption = article.title;
                this._container.findChildByName("promo_text").caption = article._Str_23333;
                this._container.findChildByName("button").visible = (!((article._Str_18393 == _Str_4053._Str_17401) || ((article._Str_18393 == _Str_4053._Str_15693) && (article._Str_18141 == ""))));
                this._container.findChildByName("button").immediateClickMode = true;
                this._container.findChildByName("button").caption = article._Str_22430;
                this._container.findChildByName("promo_image").visible = (!(article.imageUrl == ""));
                try
                {
                    IStaticBitmapWrapperWindow(this._container.findChildByName("promo_image")).assetUri = ("${image.library.url}" + article.imageUrl);
                }
                catch(e:Error)
                {
                    _landingView.context.warning(("Missing image url for promo article with title: " + article.title));
                }
            }
        }

        private function _Str_23645():void
        {
            var _local_3:IRegionWindow;
            var _local_4:IStaticBitmapWrapperWindow;
            var k:IWindowContainer = IWindowContainer(this._container.findChildByName("navigation"));
            var _local_2:int;
            while (_local_2 < _Str_18540)
            {
                _local_3 = IRegionWindow(k.getChildAt(_local_2));
                if (this._articles.length > _local_2)
                {
                    _local_4 = IStaticBitmapWrapperWindow(_local_3.getChildAt(0));
                    _local_4.assetUri = ("progress_disk_flat_" + ((this._currentArticle == _local_2) ? "on" : "off"));
                    _local_3.visible = true;
                }
                else
                {
                    _local_3.visible = false;
                }
                _local_2++;
            }
        }

        private function _Str_21361(k:int):void
        {
            var _local_2:* = (k == this._currentArticle);
            if (this._articles.length == 0)
            {
                return;
            }
            if (k < 0)
            {
                this._currentArticle = (this._articles.length - 1);
            }
            else
            {
                if (k >= this._articles.length)
                {
                    this._currentArticle = 0;
                }
                else
                {
                    this._currentArticle = k;
                }
            }
            if (_local_2)
            {
                this.refreshContent();
            }
            else
            {
                this._Str_24739();
            }
        }

        private function _Str_24739():void
        {
            this._fadePhase = 0;
            this._landingView.registerUpdateReceiver(this, 1);
        }

        private function _Str_24556():void
        {
            this._landingView.removeUpdateReceiver(this);
            this._Str_17062(1);
        }

        private function _Str_24223():void
        {
            var k:_Str_4053 = this._articles[this._currentArticle];
            switch (k._Str_18393)
            {
                case _Str_4053._Str_15693:
                    HabboWebTools.openWebPage(k._Str_18141);
                    return;
                case _Str_4053._Str_18301:
                    this._landingView.context.createLinkEvent(k._Str_18141);
                    return;
            }
        }

        private function _Str_22952(k:WindowEvent, _arg_2:IWindow):void
        {
            if (_arg_2.name == "article_navigation")
            {
                if (k.type == WindowMouseEvent.OVER)
                {
                    this._Str_19342(_arg_2, true);
                }
                else
                {
                    if (((k.type == WindowMouseEvent.OUT) && (!(_arg_2.id == this._currentArticle))))
                    {
                        this._Str_19342(_arg_2, false);
                    }
                }
            }
            if (k.type != WindowMouseEvent.CLICK)
            {
                return;
            }
            switch (_arg_2.name)
            {
                case "button":
                    this._Str_24223();
                    return;
                case "article_navigation":
                    this._Str_21361(_arg_2.id);
                    return;
            }
        }

        private function _Str_19342(k:IWindow, _arg_2:Boolean):void
        {
            var _local_3:IStaticBitmapWrapperWindow = IStaticBitmapWrapperWindow(IWindowContainer(k).getChildAt(0));
            if (!_local_3)
            {
                return;
            }
            _local_3.assetUri = ("progress_disk_flat_" + ((_arg_2) ? "on" : "off"));
        }

        private function _Str_25476(k:_Str_9504):void
        {
            var _local_2:_Str_4053;
            this._articles = [];
            for each (_local_2 in k.getParser()._Str_23579)
            {
                this._articles.push(_local_2);
            }
            this.refresh();
        }

        private function _Str_17062(k:Number):void
        {
            this._container.findChildByName("promo_title").blend = k;
            this._container.findChildByName("promo_text").blend = k;
            this._container.findChildByName("button").blend = k;
            this._container.findChildByName("promo_image").blend = k;
        }

        public function update(k:uint):void
        {
            var _local_2:uint = (this._fadePhase + k);
            if (this._fadePhase < _Str_6534)
            {
                this._Str_17062(Math.max(0, (1 - (this._fadePhase / _Str_6534))));
                if (_local_2 >= _Str_6534)
                {
                    this.refreshContent();
                }
            }
            else
            {
                this._Str_17062(Math.min(1, ((this._fadePhase - _Str_6534) / _Str_6534)));
            }
            this._fadePhase = _local_2;
            if (this._fadePhase >= (_Str_6534 * 2))
            {
                this._Str_24556();
            }
        }
    }
}
