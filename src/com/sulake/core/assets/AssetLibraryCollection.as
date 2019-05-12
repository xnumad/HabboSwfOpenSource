package com.sulake.core.assets
{
    import com.sulake.core.runtime.events.EventDispatcherWrapper;
    import __AS3__.vec.Vector;
    import flash.system.LoaderContext;
    import flash.system.ApplicationDomain;
    import com.sulake.core.utils.LibraryLoaderEvent;
    import com.sulake.core.utils.LibraryLoader;
    import flash.events.Event;
    import flash.net.URLRequest;
    import __AS3__.vec.*;

    public class AssetLibraryCollection extends EventDispatcherWrapper implements IAssetLibrary 
    {
        protected var _assetLibraries:Vector.<IAssetLibrary>;
        protected var _fileLoadQueue:Array;
        protected var _loaderContext:LoaderContext;
        protected var _binLibrary:AssetLibrary;
        protected var _manifest:XML;
        protected var _name:String;
        private var _counter:uint = 0;

        public function AssetLibraryCollection(name:String)
        {
            this._name = name;
            this._manifest = null;
            this._assetLibraries = new Vector.<IAssetLibrary>();
            this._fileLoadQueue = new Array();
            this._loaderContext = new LoaderContext(false, ApplicationDomain.currentDomain, null);
        }

        public function get url():String
        {
            return "";
        }

        public function get name():String
        {
            return this._name;
        }

        public function get isReady():Boolean
        {
            return this._fileLoadQueue.length == 0;
        }

        public function get numAssets():uint
        {
            return this.getNumAssets();
        }

        public function get nameArray():Array
        {
            return this.getAssetNameArray();
        }

        public function get manifest():XML
        {
            return (this._manifest) ? this._manifest : this._manifest = new XML();
        }

        public function get loaderContext():LoaderContext
        {
            return this._loaderContext;
        }

        public function set loaderContext(loaderContext:LoaderContext):void
        {
            this._loaderContext = loaderContext;
        }

        private function get binLibrary():IAssetLibrary
        {
            if (!this._binLibrary)
            {
                this._binLibrary = new AssetLibrary("bin");
                this._assetLibraries.splice(0, 0, this._binLibrary);
            }
            return this._binLibrary;
        }

        public function loadFromFile(libraryLoader:LibraryLoader, prepareAssets:Boolean=false):void
        {
            if (this.loaderContext == null)
            {
                this.loaderContext = this._loaderContext;
            }
            var assetLibrary:IAssetLibrary = new AssetLibrary(("lib-" + this._counter++));
            this._fileLoadQueue.push(assetLibrary);
            assetLibrary.loadFromFile(libraryLoader, prepareAssets);
            libraryLoader.addEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_COMPLETE, this.loadEventHandler);
            libraryLoader.addEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_ERROR,    this.loadEventHandler);
            libraryLoader.addEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_PROGRESS, this.loadEventHandler);
        }

        public function loadFromResource(xml:XML, type:Class):Boolean
        {
            return this.binLibrary.loadFromResource(xml, type);
        }

        public function unload():void
        {
            while (this._fileLoadQueue.length > 0)
            {
                (this._fileLoadQueue.pop() as IAssetLibrary).dispose();
            }
            while (this._assetLibraries.length > 0)
            {
                (this._assetLibraries.pop() as IAssetLibrary).dispose();
            }
        }

        override public function dispose():void
        {
            if (!disposed)
            {
                super.dispose();
                for (var i:uint; i < this._assetLibraries.length; i++ )
                {
                    this._assetLibraries.pop().dispose();
                }
                this._binLibrary = null;
            }
        }

        private function loadEventHandler(event:LibraryLoaderEvent):void
        {
            if (event.type == LibraryLoaderEvent.LIBRARY_LOADER_EVENT_COMPLETE)
            {
                var libraryLoader:LibraryLoader = (event.target as LibraryLoader);
                for (var i:uint; i < this._fileLoadQueue.length; i++)
                {
                    var assetLibrary:IAssetLibrary = (this._fileLoadQueue[i] as IAssetLibrary);
                    if (assetLibrary.url == libraryLoader.url)
                    {
                        this._fileLoadQueue.splice(i, 1);
                        break;
                    }
                }
                this._assetLibraries.push(assetLibrary);
                libraryLoader.removeEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_COMPLETE, this.loadEventHandler);
                libraryLoader.removeEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_ERROR, this.loadEventHandler);
                libraryLoader.removeEventListener(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_PROGRESS, this.loadEventHandler);
                if (this._fileLoadQueue.length == 0)
                {
                    dispatchEvent(new Event(AssetLibrary.ASSET_LIBRARY_LOADED));
                }
            }
        }

        public function hasAssetLibrary(name:String):Boolean
        {
            for each (var library:IAssetLibrary in this._assetLibraries)
            {
                if (library.name == name)
                {
                    return true;
                }
            }
            return false;
        }

        public function getAssetLibraryByName(name:String):IAssetLibrary
        {
            for each (var library:IAssetLibrary in this._assetLibraries)
            {
                if (library.name == name)
                {
                    return library;
                }
            }
            return null;
        }

        public function getAssetLibraryByUrl(url:String):IAssetLibrary
        {
            for each (var assetLibrary:IAssetLibrary in this._assetLibraries)
            {
                if (assetLibrary.url == url)
                {
                    return assetLibrary;
                }
            }
            return null;
        }

        public function addAssetLibrary(library:IAssetLibrary):void
        {
            if (this._assetLibraries.indexOf(library) == -1)
            {
                this._assetLibraries.push(library);
            }
        }

        public function loadAssetFromFile(name:String, urlRequest:URLRequest, type:String=null, _arg_4:String=null, _arg_5:int=-1, _arg_6:int=-1):AssetLoaderStruct
        {
            return this.binLibrary.loadAssetFromFile(name, urlRequest, type);
        }

        public function getAssetByName(k:String):IAsset
        {
            for each (var library:IAssetLibrary in this._assetLibraries)
            {
                var asset:IAsset = library.getAssetByName(k);
                if (asset != null)
                {
                    return asset;
                }
            }
            return null;
        }

        public function getAssetsByName(name:String):Array
        {
            var result:Array = [];
            for each (var library:IAssetLibrary in this._assetLibraries)
            {
                var asset:IAsset = library.getAssetByName(name);
                if (asset != null)
                {
                    result.push(asset);
                }
            }
            return result;
        }

        public function getAssetByContent(content:Object):IAsset
        {
            for each (var library:IAssetLibrary in this._assetLibraries)
            {
                var asset:IAsset = library.getAssetByContent(content);
                if (asset != null)
                {
                    return asset;
                }
            }
            return null;
        }

        public function getAssetByIndex(index:uint):IAsset
        {
            var counter:uint;
            var previousCounter:uint;
            for each (var library:IAssetLibrary in this._assetLibraries)
            {
                counter = (counter + library.numAssets);
                if (counter <= index)
                {
                    return library.getAssetByIndex((index - previousCounter));
                }
                previousCounter = counter;
            }
            return null;
        }

        public function getAssetIndex(asset:IAsset):int
        {
            var counter:int;
            var previousCounter:int;
            for each (var library:IAssetLibrary in this._assetLibraries)
            {
                previousCounter = library.getAssetIndex(asset);
                if (previousCounter != -1)
                {
                    return counter + previousCounter;
                }
                counter = (counter + library.numAssets);
            }
            return -1;
        }

        public function hasAsset(name:String):Boolean
        {
            for each (var library:IAssetLibrary in this._assetLibraries)
            {
                if (library.hasAsset(name))
                {
                    return true;
                }
            }
            return false;
        }

        public function setAsset(name:String, asset:IAsset, _arg_3:Boolean=true):Boolean
        {
            return this.binLibrary.setAsset(name, asset, _arg_3);
        }

        public function createAsset(name:String, typeDeclaration:AssetTypeDeclaration):IAsset
        {
            return this.binLibrary.createAsset(name, typeDeclaration);
        }

        public function removeAsset(asset:IAsset):IAsset
        {
            var _local_2:IAssetLibrary;
            for each (_local_2 in this._assetLibraries)
            {
                if (_local_2.removeAsset(asset) == asset)
                {
                    return asset;
                }
            }
            return null;
        }

        public function registerAssetTypeDeclaration(k:AssetTypeDeclaration, _arg_2:Boolean=true):Boolean
        {
            return this.binLibrary.registerAssetTypeDeclaration(k, _arg_2);
        }

        public function getAssetTypeDeclarationByMimeType(type:String, shared:Boolean=true):AssetTypeDeclaration
        {
            if (shared)
            {
                return this.binLibrary.getAssetTypeDeclarationByMimeType(type, true);
            }
            for each (var library:IAssetLibrary in this._assetLibraries)
            {
                var typeDeclaration:AssetTypeDeclaration = library.getAssetTypeDeclarationByMimeType(type, false);
                if (typeDeclaration != null)
                {
                    return typeDeclaration;
                }
            }
            return null;
        }

        public function getAssetTypeDeclarationByClass(typeClass:Class, shared:Boolean=true):AssetTypeDeclaration
        {
            if (shared)
            {
                return this.binLibrary.getAssetTypeDeclarationByClass(typeClass, true);
            }
            for each (var library:IAssetLibrary in this._assetLibraries)
            {
                var typeDeclaration:AssetTypeDeclaration = library.getAssetTypeDeclarationByClass(typeClass, false);
                if (typeDeclaration != null)
                {
                    return typeDeclaration;
                }
            }
            return null;
        }

        public function getAssetTypeDeclarationByFileName(name:String, shared:Boolean=true):AssetTypeDeclaration
        {
            if (shared)
            {
                return this.binLibrary.getAssetTypeDeclarationByFileName(name, true);
            }
            for each (var library:IAssetLibrary in this._assetLibraries)
            {
                var typeDeclaration:AssetTypeDeclaration = library.getAssetTypeDeclarationByFileName(name, false);
                if (typeDeclaration != null)
                {
                    return typeDeclaration;
                }
            }
            return null;
        }

        private function getNumAssets():uint
        {
            var num:uint;
            for each (var library:IAssetLibrary in this._assetLibraries)
            {
                num = (num + library.numAssets);
            }
            return num;
        }

        private function getAssetNameArray():Array
        {
            var out:Array = new Array();
            for each (var library:IAssetLibrary in this._assetLibraries)
            {
                out = out.concat(library.nameArray);
            }
            return out;
        }

        public function getManifests():Array
        {
            var out:Array = new Array();
            for each (var library:IAssetLibrary in this._assetLibraries)
            {
                out.push(library.manifest);
            }
            return out;
        }

        private function buildManifest():XML
        {
            var xml:XML = new XML("<manifest><library></library></manifest>");
            var xmlList:XMLList = xml.child("library");
            if (this._binLibrary)
            {
                this.applyManifestNodes(xmlList, this._binLibrary);
            }
            for each (var library:IAssetLibrary in this._assetLibraries)
            {
                this.applyManifestNodes(xmlList, library);
            }
            return xml;
        }

        private function applyManifestNodes(xmlList:XMLList, library:IAssetLibrary):void
        {
            var children:XMLList = library.manifest.library.children();
            for each (var child:XML in children)
            {
            	var childChild:XML = xmlList.child(child.name())[0];
                if (!childChild)
                {
                    xmlList.appendChild(new XML((("<" + child.name()) + "/>")));
                    childChild = xmlList.child(child.name())[0];
                }
                var childChildren:XMLList = child.children();
                for each (var subChild:XML in childChildren)
                {
                    childChild.appendChild(subChild);
                }
            }
        }
    }
}
