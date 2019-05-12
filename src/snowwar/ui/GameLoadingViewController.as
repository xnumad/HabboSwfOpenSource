package snowwar.ui
{
	import com.sulake.core.runtime.IDisposable;
    import snowwar.SnowWarEngine;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.components.IBitmapWrapperWindow;
	import com.sulake.core.assets.BitmapDataAsset;
	import com.sulake.core.window.components.IDesktopWindow;
    import com.sulake.habbo.game.WindowUtils;
    import flash.display.BitmapData;
    import flash.geom.Point;

    public class GameLoadingViewController implements IDisposable 
    {
        private var _disposed:Boolean;
        private var snowWarEngine:SnowWarEngine;
        private var windowContainer:IWindowContainer;

        public function GameLoadingViewController(snowWarEngine:SnowWarEngine)
        {
            this.snowWarEngine = snowWarEngine;
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }

        public function dispose():void
        {
            this.snowWarEngine = null;
            if (this.windowContainer)
            {
                this.windowContainer.dispose();
                this.windowContainer = null;
            }
            this._disposed = true;
        }

        public function get background():IWindow
        {
            if (!this.windowContainer)
            {
                this.loadWindow();
            }
            return this.windowContainer;
        }

        private function loadWindow():void
        {
			try
			{
            var bitmapWrapper:IBitmapWrapperWindow;
            var bitmapAsset:BitmapDataAsset;
            var desktop:IDesktopWindow = this.snowWarEngine.windowManager.getDesktop(0);
            this.windowContainer = (WindowUtils.createWindow("snowwar_loading_background_xml", 1) as IWindowContainer);
            this.windowContainer.width = desktop.width;
            this.windowContainer.height = desktop.height;
            desktop.addChildAt(this.windowContainer, 0);
            this.changeAssetState("bg_sky", "sky", this.windowContainer);
            this.changeAssetState("bg_sunshine", "sunshine", this.windowContainer);
            this.changeAssetState("bg_vista_1", "vista_1", this.windowContainer, true);
            this.changeAssetState("bg_vista_2", "vista_2", this.windowContainer, true);
            this.changeAssetState("bg_vista_3", "vista_3", this.windowContainer, true);
			}
			catch (e:Error)
			{
				Habbo.trackLoginStep(e.getStackTrace());
			}
        }

        private function changeAssetState(assetName:String, childName:String, windowContainer:IWindowContainer, visible:Boolean=false):void
        {
            var bitmapData:BitmapData;
            var widthOffset:int;
            var bitmapAsset:BitmapDataAsset = (this.snowWarEngine.assets.getAssetByName(assetName) as BitmapDataAsset);
            var bitmapWrapper:IBitmapWrapperWindow = (windowContainer.findChildByName(childName) as IBitmapWrapperWindow);
            var sourceBitmapData:BitmapData = (bitmapAsset.content as BitmapData);
            if (visible)
            {
                bitmapData = new BitmapData(windowContainer.width, sourceBitmapData.height, true, 0);
                widthOffset = 0;
                while (widthOffset < ((windowContainer.width / sourceBitmapData.width) + 1))
                {
                    bitmapData.copyPixels(sourceBitmapData, sourceBitmapData.rect, new Point((widthOffset * sourceBitmapData.width), 0));
                    widthOffset++;
                }
                bitmapWrapper.bitmap = bitmapData;
            }
            else
            {
                bitmapWrapper.bitmap = sourceBitmapData;
                bitmapWrapper.disposesBitmap = false;
            }
        }
    }
}
