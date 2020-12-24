package com.sulake.habbo.ui.widget.furniture.mysterybox
{
    import com.sulake.core.runtime.IDisposable;
    import flash.utils.Dictionary;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.habbo.ui.handler.FurnitureContextMenuWidgetHandler;
    import com.sulake.habbo.toolbar.ToolbarDisplayExtensionIds;
    import com.sulake.habbo.session.ISessionDataManager;
    import com.sulake.habbo.session.events.MysteryBoxKeysUpdateEvent;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.habbo.utils.HabboWebTools;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.components.IRegionWindow;

    public class MysteryBoxToolbarExtension implements IDisposable 
    {
        private static const MYSTERY_BOX_TOOLBAR_EXTENSION_MINIMISED:String = "mystery_box_toolbar_extension_minimised";
        public static const KEY_COLORS:Dictionary = new Dictionary();

        private var _disposed:Boolean;
        private var _window:IWindowContainer;
        private var _handler:FurnitureContextMenuWidgetHandler;

        {
            KEY_COLORS["purple"] = 9452386;
            KEY_COLORS["blue"] = 3891856;
            KEY_COLORS["green"] = 6459451;
            KEY_COLORS["yellow"] = 10658089;
            KEY_COLORS["lilac"] = 6897548;
            KEY_COLORS["orange"] = 10841125;
            KEY_COLORS["turquoise"] = 2661026;
            KEY_COLORS["red"] = 10104881;
        }

        public function MysteryBoxToolbarExtension(k:FurnitureContextMenuWidgetHandler)
        {
            this._handler = k;
        }

        public function createWindow():void
        {
            var k:XML = (this._handler.widget.assets.getAssetByName("mystery_box_toolbar_extension").content as XML);
            this._window = (this._handler.container.windowManager.buildFromXML(k) as IWindowContainer);
            this._window.findChildByName("faq_link").visible = (!(this._handler.container.config.getProperty("mysterybox.faq.url") == ""));
            this._window.procedure = this.windowProcedure;
            this._handler.container.toolbar.extensionView.attachExtension(ToolbarDisplayExtensionIds.MYSTERY_BOX, this._window);
            var _local_2:ISessionDataManager = this._handler.container.sessionDataManager;
            _local_2.events.addEventListener(MysteryBoxKeysUpdateEvent.MBKE_UPDATE, this.onKeysUpdated);
            this.setMinimised(this.minimised);
            this.setKeyColors(_local_2.mysteryBoxColor, _local_2.mysteryKeyColor);
        }

        private function windowProcedure(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type != WindowMouseEvent.CLICK)
            {
                return;
            }
            switch (k.target.name)
            {
                case "minimize_region":
                    this.setMinimised(true);
                    return;
                case "maximize_region":
                    this.setMinimised(false);
                    return;
                case "faq_link":
                    HabboWebTools.openWebPage(this._handler.container.config.getProperty("mysterybox.faq.url"), "habboMain");
                    return;
            }
        }

        private function setKeyColors(k:String, _arg_2:String):void
        {
            var _local_5:uint;
            var _local_6:uint;
            if (this._window == null)
            {
                return;
            }
            var _local_3:Boolean = ((!(k == null)) && (!(k == "")));
            this._window.findChildByName("box_colour").visible = _local_3;
            this._window.findChildByName("box_overlay").visible = _local_3;
            this._window.findChildByName("small_box").visible = ((_local_3) && (this.minimised));
            IRegionWindow(this._window.findChildByName("box_region")).toolTipCaption = ((_local_3) ? (("${mysterybox.tracker.box." + k.toLowerCase()) + "}") : "");
            if (_local_3)
            {
                _local_5 = KEY_COLORS[k.toLowerCase()];
                this._window.findChildByName("box_colour").color = _local_5;
                this._window.findChildByName("small_box").color = _local_5;
            }
            var _local_4:Boolean = ((!(_arg_2 == null)) && (!(_arg_2 == "")));
            this._window.findChildByName("key_colour").visible = _local_4;
            this._window.findChildByName("key_overlay").visible = _local_4;
            this._window.findChildByName("small_key").visible = ((_local_4) && (this.minimised));
            IRegionWindow(this._window.findChildByName("key_region")).toolTipCaption = ((_local_4) ? (("${mysterybox.tracker.key." + _arg_2.toLowerCase()) + "}") : "");
            if (_local_4)
            {
                _local_6 = KEY_COLORS[_arg_2.toLowerCase()];
                this._window.findChildByName("key_colour").color = _local_6;
                this._window.findChildByName("small_key").color = _local_6;
            }
        }

        private function onKeysUpdated(k:MysteryBoxKeysUpdateEvent):void
        {
            this.setKeyColors(k.boxColor, k.keyColor);
        }

        private function get minimised():Boolean
        {
            return (!(this._handler == null)) && (this._handler.container.config.getBoolean(MYSTERY_BOX_TOOLBAR_EXTENSION_MINIMISED));
        }

        private function setMinimised(k:Boolean):void
        {
            if (((!(this._handler == null)) && (!(this._window == null))))
            {
                if (k)
                {
                    this._window.findChildByName("minimize_region").visible = false;
                    this._window.findChildByName("maximize_region").visible = true;
                    this._window.findChildByName("small_box").visible = this._window.findChildByName("box_colour").visible;
                    this._window.findChildByName("small_key").visible = this._window.findChildByName("key_colour").visible;
                    this._window.height = 25;
                }
                else
                {
                    this._window.findChildByName("minimize_region").visible = true;
                    this._window.findChildByName("maximize_region").visible = false;
                    this._window.findChildByName("small_box").visible = false;
                    this._window.findChildByName("small_key").visible = false;
                    this._window.height = 137;
                }
                this._handler.container.config.setProperty(MYSTERY_BOX_TOOLBAR_EXTENSION_MINIMISED, k.toString());
            }
        }

        public function dispose():void
        {
            if (this._disposed)
            {
                return;
            }
            if (this._window != null)
            {
                this._window.dispose();
                this._window = null;
            }
            if (this._handler != null)
            {
                this._handler.container.toolbar.extensionView.detachExtension(ToolbarDisplayExtensionIds.MYSTERY_BOX);
                this._handler.container.sessionDataManager.events.removeEventListener(MysteryBoxKeysUpdateEvent.MBKE_UPDATE, this.onKeysUpdated);
                this._handler = null;
            }
            this._disposed = true;
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }
    }
}
