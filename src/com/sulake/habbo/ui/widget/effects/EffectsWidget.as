package com.sulake.habbo.ui.widget.effects
{
    import com.sulake.habbo.ui.widget.ConversionTrackingWidget;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.components.IScrollableListWindow;
    import com.sulake.core.utils.Map;
    import com.sulake.habbo.ui.IRoomWidgetHandler;
    import com.sulake.habbo.window.IHabboWindowManager;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.habbo.ui.handler.EffectsWidgetHandler;
    import com.sulake.core.assets.XmlAsset;
    import flash.geom.Rectangle;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.habbo.ui.widget.memenu.IWidgetAvatarEffect;

    public class EffectsWidget extends ConversionTrackingWidget 
    {
        private static const _Str_18779:int = 320;
        private static const _Str_16932:int = 48;
        private static const _Str_16128:int = 2;

        private var _view:IWindowContainer;
        private var _list:IScrollableListWindow;
        private var _effectViews:Map;

        public function EffectsWidget(k:IRoomWidgetHandler, _arg_2:IHabboWindowManager, _arg_3:IAssetLibrary)
        {
            super(k, _arg_2, _arg_3);
            this.handler.widget = this;
            this._effectViews = new Map();
        }

        public function get handler():EffectsWidgetHandler
        {
            return _Str_2470 as EffectsWidgetHandler;
        }

        override public function dispose():void
        {
            var k:_Str_4860;
            if (disposed)
            {
                return;
            }
            if (this._effectViews)
            {
                for each (k in this._effectViews)
                {
                    k.dispose();
                }
                this._effectViews.dispose();
                this._effectViews = null;
            }
            this._list = null;
            if (this._view)
            {
                this._view.dispose();
                this._view = null;
            }
            super.dispose();
        }

        public function open():void
        {
            var k:XmlAsset;
            var _local_2:Rectangle;
            var _local_3:IWindow;
            if (!this._view)
            {
                k = (assets.getAssetByName("effects_widget") as XmlAsset);
                this._view = (windowManager.buildFromXML((k.content as XML)) as IWindowContainer);
                _local_2 = this.handler.container.toolbar.getRect();
                this._view.x = (_local_2.right + _Str_16128);
                this._view.y = (_local_2.bottom - this._view.height);
                this._list = (this._view.findChildByName("list") as IScrollableListWindow);
                _local_3 = this._view.findChildByName("close");
                _local_3.addEventListener(WindowMouseEvent.CLICK, this.onCloseHandler);
            }
            this.update();
            this._view.visible = true;
        }

        public function update():void
        {
            var k:_Str_4860;
            var _local_3:IWidgetAvatarEffect;
            var _local_4:int;
            var _local_2:Array = this.handler.container.inventory.getAvatarEffects();
            for each (_local_3 in _local_2)
            {
                k = (this._effectViews.getValue(_local_3.type) as _Str_4860);
                if (k)
                {
                    k.update();
                }
                else
                {
                    k = new _Str_4860(this, _local_3);
                    this._effectViews.add(_local_3.type, k);
                    this._list.addListItem(k.window);
                }
            }
            _local_4 = (this._effectViews.length - 1);
            while (_local_4 >= 0)
            {
                k = this._effectViews.getWithIndex(_local_4);
                if (_local_2.indexOf(k.effect) == -1)
                {
                    this._list.removeListItem(k.window);
                    this._effectViews.remove(this._effectViews.getKey(_local_4));
                    k.dispose();
                }
                _local_4--;
            }
            var _local_5:int = this._list.visibleRegion.height;
            this._list.height = Math.max(Math.min(_local_5, _Str_18779), _Str_16932);
            this._view.findChildByName("no_effects").visible = (_local_2.length == 0);
        }

        public function _Str_25077(k:int, _arg_2:Boolean):void
        {
            if (_arg_2)
            {
                this.handler.container.inventory.setEffectDeselected(k);
            }
            else
            {
                this.handler.container.inventory.setEffectSelected(k);
            }
        }

        private function onCloseHandler(k:WindowMouseEvent):void
        {
            this._view.visible = false;
        }
    }
}
