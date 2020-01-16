# summernote-file

[Summernote](https://summernote.org/) plugin to insert files by URL or file upload.

[![npm version](https://badge.fury.io/js/summernote-file.svg)](https://badge.fury.io/js/summernote-file)

_Based on the [summernote-audio](https://github.com/taalendigitaal/summernote-audio) plugin._

It can handle **picture files** (jpg, png, gif, wvg, webp), **audio files** (mp3, ogg, oga), and **video files** (mp4, ogv, webm) without any upload, in base64.

You can also define your own handle in order to **upload these files, and any other type of file** into your server, and render them in Summernote.

### Classic use

Include the plugin script after including Summernote:

```html
<!-- include jquery, bootstrap, summernote here -->

<script type="text/javascript" src="summernote-file.js"></script>
```

### NPM

You can add summernote-file in your project with using [npm](https://www.npmjs.com/) : npm i summernote-file


### Configuration

Add the file button to the Summernote toolbar:

```javascript
$('.summernote').summernote({
    toolbar:[
        ['insert', ['link', 'picture', 'video', 'file']],
    ],
});
```

### File type

By default, the plugin can handle picture, audio, and video files, in **base64**.
In order to handle all type of files, **you have to implement the "onFileUpload" callback** for uploading them into you server :

```javascript
$('.summernote').summernote({
    //Your classic summernote code here

    //Define the callback
    callbacks: {
        onFileUpload: function(file) {
            //Your own code goes here
        },
    },
});
```

### Callback exemple for uploading

Here is an exemple of the callback (with upload progress handling) :

```javascript
$('.summernote').summernote({
    //Your classic summernote code here
    
    //Define the callback
    callbacks: {
        onFileUpload: function(file) {
            myOwnCallBack(file[0]);
        },
    },
});

function myOwnCallBack(file) {
    let data = new FormData();
    data.append("file", file);
    $.ajax({
        data: data,
        type: "POST",
        url: "file-uploader.php", //Your own back-end uploader
        cache: false,
        contentType: false,
        processData: false,
        xhr: function() { //Handle progress upload
            let myXhr = $.ajaxSettings.xhr();
            if (myXhr.upload) myXhr.upload.addEventListener('progress', progressHandlingFunction, false);
            return myXhr;
        },
        success: function(reponse) {
            if(reponse.status === true) {
                let listMimeImg = ['image/png', 'image/jpeg', 'image/webp', 'image/gif', 'image/svg'];
                let listMimeAudio = ['audio/mpeg', 'audio/ogg'];
                let listMimeVideo = ['video/mpeg', 'video/mp4', 'video/webm'];
                let elem;

                if (listMimeImg.indexOf(file.type) > -1) {
                    //Picture
                    $('.summernote').summernote('editor.insertImage', reponse.filename);
                } else if (listMimeAudio.indexOf(file.type) > -1) {
                    //Audio
                    elem = document.createElement("audio");
                    elem.setAttribute("src", reponse.filename);
                    elem.setAttribute("controls", "controls");
                    elem.setAttribute("preload", "metadata");
                    $('.summernote').summernote('editor.insertNode', elem);
                } else if (listMimeVideo.indexOf(file.type) > -1) {
                    //Video
                    elem = document.createElement("video");
                    elem.setAttribute("src", reponse.filename);
                    elem.setAttribute("controls", "controls");
                    elem.setAttribute("preload", "metadata");
                    $('.summernote').summernote('editor.insertNode', elem);
                } else {
                    //Other file type
                    elem = document.createElement("a");
                    let linkText = document.createTextNode(file.name);
                    elem.appendChild(linkText);
                    elem.title = file.name;
                    elem.href = reponse.filename;
                    $('.summernote').summernote('editor.insertNode', elem);
                }
            }
        }
    });
}

function progressHandlingFunction(e) {
    if (e.lengthComputable) {
        //Log current progress
        console.log((e.loaded / e.total * 100) + '%');

        //Reset progress on complete
        if (e.loaded === e.total) {
            console.log("Upload finished.");
        }
    }
}
```

### Translations

Currently supports the following languages:
* English
* French
