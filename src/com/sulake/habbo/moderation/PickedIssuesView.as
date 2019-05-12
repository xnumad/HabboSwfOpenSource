package com.sulake.habbo.moderation
{
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.components.IItemListWindow;

    public class PickedIssuesView implements IIssueBrowserView 
    {
        private var _issueManager:IssueManager;
        private var _issueBrowser:IssueBrowser;
        private var _window:IWindowContainer;
        private var _issueListView:IssueListView;

        public function PickedIssuesView(k:IssueManager, _arg_2:IssueBrowser, _arg_3:IWindowContainer)
        {
            this._issueManager = k;
            this._issueBrowser = _arg_2;
            this._window = _arg_3;
            this._window.visible = false;
            var _local_4:IItemListWindow = (this._window.findChildByName("issue_list") as IItemListWindow);
            this._issueListView = new IssueListView(k, _arg_2, _local_4);
        }

        public function get view():IWindowContainer
        {
            return this._window;
        }

        public function set visible(k:Boolean):void
        {
            this._window.visible = k;
        }

        public function update():void
        {
            var k:Array = this._issueManager._Str_15829(IssueManager.ISSUE_BUNDLE_PICKED);
            this._issueListView.update(k);
        }
    }
}
