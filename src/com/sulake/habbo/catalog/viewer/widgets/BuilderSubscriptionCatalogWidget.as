package com.sulake.habbo.catalog.viewer.widgets
{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.habbo.catalog.HabboCatalog;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetEvent;
    import com.sulake.core.window.IWindow;
    import com.sulake.habbo.catalog.enum.CatalogType;
    import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetBuilderSubscriptionUpdatedEvent;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.habbo.utils.HabboWebTools;
    import com.sulake.habboclient._Str_5079;
    import com.sulake.core.window.events.WindowEvent;

    public class BuilderSubscriptionCatalogWidget extends CatalogWidget implements IDisposable 
    {
        private var _catalog:HabboCatalog;
        private var _optionalSubscribeUrl:String;

        public function BuilderSubscriptionCatalogWidget(k:IWindowContainer, _arg_2:HabboCatalog)
        {
            super(k);
            this._catalog = _arg_2;
        }

        override public function init():Boolean
        {
            if (!super.init())
            {
                return false;
            }
            this._optionalSubscribeUrl = this._catalog.getProperty("builders_club.buy_membership_page");
            this._Str_19488();
            _window.procedure = this._Str_2533;
            events.addEventListener(CatalogWidgetEvent.BUILDER_SUBSCRIPTION_UPDATED, this._Str_23869);
            return true;
        }

        private function _Str_19488():void
        {
            var k:Number = this._catalog._Str_10140;
            var _local_2:IWindow = _window.findChildByName("subscribe_button");
            var _local_3:IWindow = _window.findChildByName("subscribe_button_sms");
            var _local_4:IWindow = _window.findChildByName("subscribe_button_big");
            var _local_5:IWindow = _window.findChildByName("try_button");
            if ((((!(!(_local_5 == null))) || (!(!(_local_2 == null)))) || (!(!(_local_4 == null)))))
            {
                return;
            }
            if (((k > 0) || (this._catalog.getCatalogNavigator(CatalogType.BUILDER).getOptionalNodeByName(this._catalog.getProperty("builders_club.try_page")) == null)))
            {
                _local_4.visible = true;
                _local_2.visible = false;
                _local_5.visible = false;
                _local_3.visible = false;
            }
            else
            {
                _local_4.visible = false;
                _local_2.visible = true;
                _local_5.visible = true;
                _local_3.visible = false;
            }
            if (((!(this._optionalSubscribeUrl == null)) && (!(this._optionalSubscribeUrl == ""))))
            {
                _local_3.visible = true;
                if (!_local_5.visible)
                {
                    _local_3.x = _local_5.x;
                    _local_3.y = _local_5.y;
                }
                if (_local_4.visible)
                {
                    _local_4.visible = false;
                    _local_2.visible = true;
                }
            }
        }

        private function _Str_23869(k:CatalogWidgetBuilderSubscriptionUpdatedEvent):void
        {
            this._Str_19488();
        }

        private function _Str_2533(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type != WindowMouseEvent.CLICK)
            {
                return;
            }
            switch (_arg_2.name)
            {
                case "subscribe_button_big":
                case "subscribe_button":
                    HabboWebTools.openWebPageAndMinimizeClient(this._catalog.getProperty(_Str_5079.WEB_SHOP_SUBSCRIPTION_RELATIVEURL));
                    return;
                case "subscribe_button_sms":
                    HabboWebTools.openWebPageAndMinimizeClient(this._optionalSubscribeUrl);
                    return;
                case "try_button":
                    this._catalog.openCatalogPage(this._catalog.getProperty("builders_club.try_page"), CatalogType.BUILDER);
                    return;
            }
        }
    }
}
