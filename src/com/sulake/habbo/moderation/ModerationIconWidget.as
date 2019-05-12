package com.sulake.habbo.moderation
{
	import com.sulake.core.runtime.IDisposable;
	import com.sulake.core.window.IWindowContainer;
	import com.sulake.core.window.components.IBitmapWrapperWindow;
	import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.events.WindowMouseEvent;
	public class ModerationIconWidget implements IDisposable
	{
		private var _moderationManager:ModerationManager;
		private var _frame:IWindowContainer;
		
		private var _disposed:Boolean = false;
		
		public function ModerationIconWidget(moderationManager:ModerationManager)
		{
			this._moderationManager = moderationManager;
		}
		
		public function get disposed():Boolean
        {
            return this._disposed;
        }

        public function dispose():void
        {
            if (!this._disposed)
            {
                this._moderationManager = null;
                if (this._frame)
                {
                    this._frame.dispose();
                    this._frame = null;
                }
            }
        }
		
		public function show(visible:Boolean):void
        {
            if (this._frame == null)
            {
                this._frame = IWindowContainer(this._moderationManager.getXmlWindow("moderation_icon"));
                this._frame.addEventListener(WindowMouseEvent.CLICK, this.onClickHandler);
            }
			
			if (this._frame != null)
			{
				this._frame.visible = false;//visible;
			}
		}
		
		public function onClickHandler(event:WindowEvent):void
		{
			this._moderationManager.setVisible(true);
		}
	}
}
