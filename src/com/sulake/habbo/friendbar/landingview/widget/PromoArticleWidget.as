package com.sulake.habbo.friendbar.landingview.widget
{
    import com.sulake.habbo.friendbar.landingview.interfaces.ILandingViewWidget;
    import com.sulake.habbo.friendbar.landingview.interfaces.ISettingsAwareWidget;
    import com.sulake.core.runtime.IUpdateReceiver;
    import com.sulake.habbo.friendbar.landingview.HabboLandingView;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.landingview.PromoArticlesMessageEvent;
    import com.sulake.habbo.communication.messages.outgoing.landingview.GetPromoArticlesComposer;
    import com.sulake.core.window.IWindow;
    import com.sulake.habbo.friendbar.landingview.layout.WidgetContainerLayout;
    import com.sulake.habbo.friendbar.landingview.layout.CommonWidgetSettings;
    import com.sulake.habbo.communication.messages.incoming.landingview.PromoArticleData;
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
            this._container.procedure = this.onMouse;
            this._articlesListener = new PromoArticlesMessageEvent(this.onPromoArticles);
            this._landingView.communicationManager.addHabboConnectionMessageEvent(this._articlesListener);
        }

        public function refresh():void
        {
            if (((this._lastRequestTime == null) || ((this._lastRequestTime.time + _Str_3981) < new Date().time)))
            {
                this._landingView.send(new GetPromoArticlesComposer());
                this._lastRequestTime = new Date();
            }
            else
            {
                this.goToArticle(this._currentArticle);
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

        public function set settings(k:CommonWidgetSettings):void
        {
            WidgetContainerLayout.applyCommonWidgetSettings(this._container, k);
        }

        private function refreshContent():void
        {
            this.setArticleContent();
            this.setNavigationDisks();
        }

        private function setArticleContent():void
        {
            var article:PromoArticleData;
            article = this._articles[this._currentArticle];
            if (article)
            {
                this._container.findChildByName("promo_title").caption = article.title;
                this._container.findChildByName("promo_text").caption = article.bodyText;
                this._container.findChildByName("button").visible = (!((article.linkType == PromoArticleData.LINK_TYPE_NO_LINK) || ((article.linkType == PromoArticleData.LINK_TYPE_URL) && (article.linkContent == ""))));
                this._container.findChildByName("button").immediateClickMode = true;
                this._container.findChildByName("button").caption = article.buttonText;
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

        private function setNavigationDisks():void
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

        private function goToArticle(k:int):void
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
                this.startFade();
            }
        }

        private function startFade():void
        {
            this._fadePhase = 0;
            this._landingView.registerUpdateReceiver(this, 1);
        }

        private function stopFade():void
        {
            this._landingView.removeUpdateReceiver(this);
            this.setBlend(1);
        }

        private function followLink():void
        {
            var k:PromoArticleData = this._articles[this._currentArticle];
            switch (k.linkType)
            {
                case PromoArticleData.LINK_TYPE_URL:
                    HabboWebTools.openWebPage(k.linkContent);
                    return;
                case PromoArticleData.LINK_TYPE_INTERNAL:
                    this._landingView.context.createLinkEvent(k.linkContent);
                    return;
            }
        }

        private function onMouse(k:WindowEvent, _arg_2:IWindow):void
        {
            if (_arg_2.name == "article_navigation")
            {
                if (k.type == WindowMouseEvent.OVER)
                {
                    this.hoverOverNavigation(_arg_2, true);
                }
                else
                {
                    if (((k.type == WindowMouseEvent.OUT) && (!(_arg_2.id == this._currentArticle))))
                    {
                        this.hoverOverNavigation(_arg_2, false);
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
                    this.followLink();
                    return;
                case "article_navigation":
                    this.goToArticle(_arg_2.id);
                    return;
            }
        }

        private function hoverOverNavigation(k:IWindow, _arg_2:Boolean):void
        {
            var _local_3:IStaticBitmapWrapperWindow = IStaticBitmapWrapperWindow(IWindowContainer(k).getChildAt(0));
            if (!_local_3)
            {
                return;
            }
            _local_3.assetUri = ("progress_disk_flat_" + ((_arg_2) ? "on" : "off"));
        }

        private function onPromoArticles(k:PromoArticlesMessageEvent):void
        {
            var _local_2:PromoArticleData;
            this._articles = [];
            for each (_local_2 in k.getParser().articles)
            {
                this._articles.push(_local_2);
            }
            this.refresh();
        }

        private function setBlend(k:Number):void
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
                this.setBlend(Math.max(0, (1 - (this._fadePhase / _Str_6534))));
                if (_local_2 >= _Str_6534)
                {
                    this.refreshContent();
                }
            }
            else
            {
                this.setBlend(Math.min(1, ((this._fadePhase - _Str_6534) / _Str_6534)));
            }
            this._fadePhase = _local_2;
            if (this._fadePhase >= (_Str_6534 * 2))
            {
                this.stopFade();
            }
        }
    }
}
