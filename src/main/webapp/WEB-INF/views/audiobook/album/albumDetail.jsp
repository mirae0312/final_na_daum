<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8" />
<jsp:include page="/WEB-INF/views/audiobook/common/audioBookHeader.jsp">
	<jsp:param value="Le Café Livres" name="title" />
</jsp:include>

<script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:set var="imgPath" value="/resources/upload/audiobook/img/"/>
<c:set var="imgName" value="${img.renamedFilename}"/>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/audiobook/track.css" />
<link rel="script"
	href="${pageContext.request.contextPath}/resources/js/audiobook/player.js" />
<style>
.right-col {
	float: right;
	margin-right: 6%;
	margin-top: 120px;
	display: flex;
	align-items: center;
}

.right-col p {
	font-size: 18px;
	color: #5f5f5f;
	font-weight: 400;
	margin-right: 15px;
}

.play-icon {
	width: 70px;
	cursor: pointer;
}

.playBtn {
	height: 50px;
	width: 30px
}

.img-thumbnail {
	width: auto;
	height: 100px;
}

#audioContainer {
	position: fixed;
	bottom: 0;
}
.sub-menu td, .sub-menu th, .table thead th{
	border-top : 0px;
	border-bottom :0px;
}

</style>
<div class="row row-cols-lg-12 mb-2 justify-content-center relative sub-menu">
	<div class="col-3 ml-4 pr-0">
		<img src="${contextPath}${imgPath}${img.renamedFilename}"
			class="" style="height: 300px; width: 300px;">
	</div>

	<div class="col-4 sub-menu">
		<table class="table">
			<thead class="thead">
				<tr>
					<th scope="col">${album.provider}</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><p class="al-tp">${album.title}</p></td>
				</tr>
				<tr>
					<td class="al-creator"><p class="al-creator">${album.creator}</p></td>
				</tr>
				<tr>
					<td id="code"><p class="al-code" style="display: none;">${album.code}</p></td>
				</tr>
				<tr>
					<td></td>
				</tr>
				<tr>
					<td><a href="" style="text-decoration:none; color:black;">찜하기</a></td>
				</tr>
				<tr>
					<td style="vertical-align: middle;">
					<c:choose>
						<c:when test="${empty loginMember.id}">
							1분 미리듣기중입니다
						</c:when>
						<c:otherwise>
							<a href="">미공개 뮤직비디오</a>
						</c:otherwise>
					</c:choose>
					 &nbsp; &nbsp;
						&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span
						style="display: inline-block; text-align: right"><img
							class="play-icon" style="width: 100px;"
							src="${pageContext.request.contextPath}/resources/images/audiobook/play.png"
							id="play"> </span>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
	<%-- <div class="col-2 ml-2">장르: 클래식 ${album.kind}</div> --%>
</div>


<div class="row row-cols-md-1 justify-content-center ">
	<div class="col-md-6">
		<table>
			<thead class="table" id="track-list">
				<tr>
					<th scope="col"></th>
					<th scope="col">수록곡</th>
					<!-- <th scope="col">리뷰</th> -->
					<th scope="col"></th>
					<th scope="col"></th>
				</tr>
			</thead>
		</table>
		<table class="table" id="track-list">
			<tbody>
				<c:forEach items="${trackList}" var="track" varStatus="no">
					<tr>
						<th scope="row"></th>
						<!--${no.index}  -->
						<td><img
							src="${contextPath}${imgPath}${imgName}"
							alt="..." class="img-thumbnail"></td>
						<td style="vertical-align: middle;">
							${fn:replace(track.originalFilename,".mp3","")}
						</td>
						<%-- <td style="vertical-align: middle;">
							<img class="play-icon"
							src="${pageContext.request.contextPath}/resources/images/audiobook/play.png"
							id="play">
						</td> --%>
					</tr>
					
				</c:forEach>
			</tbody>
		</table>
	</div>
	<div class="col-md-3"></div>
</div>
<!-- audio player start -->

<div class="ap" id="ap">
	<div class="ap__inner">
		<div class="ap__item ap__item--playback">
			<button class="ap__controls ap__controls--prev">
				<svg version="1.1" xmlns="http://www.w3.org/2000/svg"
					xmlns:xlink="http://www.w3.org/1999/xlink" fill="#333" width="24"
					height="24" viewBox="0 0 24 24">
                        <path
						d="M9.516 12l8.484-6v12zM6 6h2.016v12h-2.016v-12z"></path>
                    </svg>
			</button>
			<button class="ap__controls ap__controls--toggle">
				<svg class="icon-play" version="1.1"
					xmlns="http://www.w3.org/2000/svg"
					xmlns:xlink="http://www.w3.org/1999/xlink" fill="#333" width="36"
					height="36" viewBox="0 0 36 36"
					data-play="M 12,26 18.5,22 18.5,14 12,10 z M 18.5,22 25,18 25,18 18.5,14 z"
					data-pause="M 12,26 16.33,26 16.33,10 12,10 z M 20.66,26 25,26 25,10 20.66,10 z">
                        <path
						d="M 12,26 18.5,22 18.5,14 12,10 z M 18.5,22 25,18 25,18 18.5,14 z"></path>
                    </svg>
			</button>
			<button class="ap__controls ap__controls--next">
				<svg version="1.1" xmlns="http://www.w3.org/2000/svg"
					xmlns:xlink="http://www.w3.org/1999/xlink" fill="#333" width="24"
					height="24" viewBox="0 0 24 24">
                        <path
						d="M15.984 6h2.016v12h-2.016v-12zM6 18v-12l8.484 6z"></path>
                    </svg>
			</button>
		</div>
		<div class="ap__item ap__item--track">
			<div class="track">
				<div class="track__title">There is no playList</div>
				<!-- <div class="track__time">
                        <span class="track__time--current">--</span>
                        <span> / </span>
                        <span class="track__time--duration">--</span>
                    </div> -->

				<div class="progress-container">
					<div class="progress">
						<div class="progress__bar"></div>
						<div class="progress__preload"></div>
					</div>
				</div>

			</div>
		</div>
		<div class="ap__item ap__item--settings">
			<div class="track__time">
				<span class="track__time--current">--</span> <span> / </span> <span
					class="track__time--duration">--</span>
			</div>
			<div class="ap__controls volume-container">
				<button class="volume-btn">
					<svg class="icon-volume-on" version="1.1"
						xmlns="http://www.w3.org/2000/svg"
						xmlns:xlink="http://www.w3.org/1999/xlink" fill="#333" width="24"
						height="24" viewBox="0 0 24 24">
                            <path
							d="M14.016 3.234q3.047 0.656 5.016 3.117t1.969 5.648-1.969 5.648-5.016 3.117v-2.063q2.203-0.656 3.586-2.484t1.383-4.219-1.383-4.219-3.586-2.484v-2.063zM16.5 12q0 2.813-2.484 4.031v-8.063q2.484 1.219 2.484 4.031zM3 9h3.984l5.016-5.016v16.031l-5.016-5.016h-3.984v-6z">
                            </path>
                        </svg>
					<svg class="icon-volume-off" version="1.1"
						xmlns="http://www.w3.org/2000/svg"
						xmlns:xlink="http://www.w3.org/1999/xlink" fill="#333" width="24"
						height="24" viewBox="0 0 24 24">
                            <path
							d="M12 3.984v4.219l-2.109-2.109zM4.266 3l16.734 16.734-1.266 1.266-2.063-2.063q-1.734 1.359-3.656 1.828v-2.063q1.172-0.328 2.25-1.172l-4.266-4.266v6.75l-5.016-5.016h-3.984v-6h4.734l-4.734-4.734zM18.984 12q0-2.391-1.383-4.219t-3.586-2.484v-2.063q3.047 0.656 5.016 3.117t1.969 5.648q0 2.25-1.031 4.172l-1.5-1.547q0.516-1.266 0.516-2.625zM16.5 12q0 0.422-0.047 0.609l-2.438-2.438v-2.203q2.484 1.219 2.484 4.031z">
                            </path>
                        </svg>
				</button>
				<div class="volume">
					<div class="volume__track">
						<div class="volume__bar"></div>
					</div>
				</div>
			</div>
			<button class="ap__controls ap__controls--repeat">
				<svg version="1.1" xmlns="http://www.w3.org/2000/svg"
					xmlns:xlink="http://www.w3.org/1999/xlink" fill="#333" width="24"
					height="24" viewBox="0 0 24 24">
                        <path
						d="M17.016 17.016v-4.031h1.969v6h-12v3l-3.984-3.984 3.984-3.984v3h10.031zM6.984 6.984v4.031h-1.969v-6h12v-3l3.984 3.984-3.984 3.984v-3h-10.031z">
                        </path>
                    </svg>
			</button>
			<button class="ap__controls ap__controls--playlist">
				<svg version="1.1" xmlns="http://www.w3.org/2000/svg"
					xmlns:xlink="http://www.w3.org/1999/xlink" fill="#333" width="24"
					height="24" viewBox="0 0 24 24">
                        <path
						d="M17.016 12.984l4.969 3-4.969 3v-6zM2.016 15v-2.016h12.984v2.016h-12.984zM18.984 5.016v1.969h-16.969v-1.969h16.969zM18.984 9v2.016h-16.969v-2.016h16.969z">
                        </path>
                    </svg>
			</button>
		</div>
	</div>
</div>

<!-- *****player javascript****** -->
<script>
(function (window, undefined) {

    'use strict';

    var AudioPlayer = (function () {

        // Player vars!
        var
            docTitle = document.title,
            player = document.getElementById('ap'),
            playBtn,
            playSvg,
            playSvgPath,
            prevBtn,
            nextBtn,
            plBtn,
            repeatBtn,
            volumeBtn,
            progressBar,
            preloadBar,
            curTime,
            durTime,
            trackTitle,
            audio,
            index = 0,
            playList,
            volumeBar,
            wheelVolumeValue = 0,
            volumeLength,
            repeating = false,
            seeking = false,
            seekingVol = false,
            rightClick = false,
            apActive = false,
            
            // playlist vars
            pl,
            plUl,
            plLi,
            /* 동적으로 생성됨. */
            tplList =
                '<li class="pl-list" data-track="{count}">' +
                '<div class="pl-list__track">' +
                '<div class=""><i class=\'fas fa-headphones-alt\' style=\'font-size:24px\'></i></div>' +
                '<div class="pl-list__eq">' +
                
                '</div>' +
                '</div>' +
                '<div class="pl-list__title">{title}</div>' +
                '<button class="pl-list__remove">' +
                '<svg fill="#000000" height="20" viewBox="0 0 24 24" width="20" xmlns="http://www.w3.org/2000/svg">' +
                '<path d="M6 19c0 1.1.9 2 2 2h8c1.1 0 2-.9 2-2V7H6v12zM19 4h-3.5l-1-1h-5l-1 1H5v2h14V4z"/>' +
                '<path d="M0 0h24v24H0z" fill="none"/>' +
                '</svg>' +
                '</button>' +
                '</li>',
            // settings
            
            settings = {
                volume: 0.6, 
                changeDocTitle: true,
                confirmClose: true,
                autoPlay: false,
                buffered: true,
                notification: true,
                playList: []
            };

        function init(options) {

            if (!('classList' in document.documentElement)) {
                return false;
            }

            if (apActive || player === null) {
                return 'Player already init';
            }

            settings = extend(settings, options);

            // get player elements
            playBtn = player.querySelector('.ap__controls--toggle');
            playSvg = playBtn.querySelector('.icon-play');
            playSvgPath = playSvg.querySelector('path');
            prevBtn = player.querySelector('.ap__controls--prev');
            nextBtn = player.querySelector('.ap__controls--next');
            repeatBtn = player.querySelector('.ap__controls--repeat');
            volumeBtn = player.querySelector('.volume-btn');
            plBtn = player.querySelector('.ap__controls--playlist');
            curTime = player.querySelector('.track__time--current');
            durTime = player.querySelector('.track__time--duration');
            trackTitle = player.querySelector('.track__title');
            progressBar = player.querySelector('.progress__bar');
            preloadBar = player.querySelector('.progress__preload');
            volumeBar = player.querySelector('.volume__bar');

            playList = settings.playList;

            playBtn.addEventListener('click', playToggle, false);
            volumeBtn.addEventListener('click', volumeToggle, false);
            repeatBtn.addEventListener('click', repeatToggle, false);

            progressBar.closest('.progress-container').addEventListener('mousedown', handlerBar, false);
            progressBar.closest('.progress-container').addEventListener('mousemove', seek, false);

            document.documentElement.addEventListener('mouseup', seekingFalse, false);

            volumeBar.closest('.volume').addEventListener('mousedown', handlerVol, false);
            volumeBar.closest('.volume').addEventListener('mousemove', setVolume);
            volumeBar.closest('.volume').addEventListener(wheel(), setVolume, false);

            prevBtn.addEventListener('click', prev, false);
            nextBtn.addEventListener('click', next, false);

            apActive = true;

            // Create playlist
            renderPL();
            plBtn.addEventListener('click', plToggle, false);

            // Create audio object
            audio = new Audio();
            audio.volume = settings.volume;
            audio.preload = 'auto';

            audio.addEventListener('error', errorHandler, false);
            audio.addEventListener('timeupdate', timeUpdate, false);
            audio.addEventListener('ended', doEnd, false);

            volumeBar.style.height = audio.volume * 100 + '%';
            volumeLength = volumeBar.css('height');

            if (settings.confirmClose) {
                window.addEventListener("beforeunload", beforeUnload, false);
            }

            if (isEmptyList()) {
                return false;
            }
            audio.src = playList[index].file;
            trackTitle.innerHTML = playList[index].title;

            if (settings.autoPlay) {
                audio.play();
                playBtn.classList.add('is-playing');
                playSvgPath.setAttribute('d', playSvg.getAttribute('data-pause'));
                plLi[index].classList.add('pl-list--current');
                notify(playList[index].title, {
                    icon: playList[index].icon,
                    body: 'Now playing'
                });
            }
        }

        function changeDocumentTitle(title) {
            if (settings.changeDocTitle) {
                if (title) {
                    document.title = title;
                }
                else {
                    document.title = docTitle;
                }
            }
        }

        function beforeUnload(evt) {
            if (!audio.paused) {
                var message = 'Music still playing';
                evt.returnValue = message;
                return message;
            }
        }

        function errorHandler(evt) {
            if (isEmptyList()) {
                return;
            }
            var mediaError = {
                '1': 'MEDIA_ERR_ABORTED',
                '2': 'MEDIA_ERR_NETWORK',
                '3': 'MEDIA_ERR_DECODE',
                '4': 'MEDIA_ERR_SRC_NOT_SUPPORTED'
            };
            audio.pause();
            curTime.innerHTML = '--';
            durTime.innerHTML = '--';
            progressBar.style.width = 0;
            preloadBar.style.width = 0;
            playBtn.classList.remove('is-playing');
            playSvgPath.setAttribute('d', playSvg.getAttribute('data-play'));
            plLi[index] && plLi[index].classList.remove('pl-list--current');
            changeDocumentTitle();
            throw new Error('Houston we have a problem: ' + mediaError[evt.target.error.code]);
        }

        /**
         * UPDATE PL
         */
        function updatePL(addList) {
            if (!apActive) {
                return 'Player is not yet initialized';
            }
            if (!Array.isArray(addList)) {
                return;
            }
            if (addList.length === 0) {
                return;
            }

            var count = playList.length;
            var html = [];
            playList.push.apply(playList, addList);
            addList.forEach(function (item) {
                html.push(
                    tplList.replace('{count}', count++).replace('{title}', item.title)
                );
            });
            // If exist empty message
            if (plUl.querySelector('.pl-list--empty')) {
                plUl.removeChild(pl.querySelector('.pl-list--empty'));
                audio.src = playList[index].file;
                trackTitle.innerHTML = playList[index].title;
            }
            // Add song into playlist
            plUl.insertAdjacentHTML('beforeEnd', html.join(''));
            plLi = pl.querySelectorAll('li');
        }

        /**
         *  PlayList methods
         */
        function renderPL() {
            var html = [];

            playList.forEach(function (item, i) {
                html.push(
                    tplList.replace('{count}', i).replace('{title}', item.title)
                );
            });

            pl = create('div', {
                'className': 'pl-container',
                'id': 'pl',
                'innerHTML': '<ul class="pl-ul">' + (!isEmptyList() ? html.join('') : '<li class="pl-list--empty">PlayList is empty</li>') + '</ul>'
            });

            player.parentNode.insertBefore(pl, player.nextSibling);

            plUl = pl.querySelector('.pl-ul');
            plLi = plUl.querySelectorAll('li');

            pl.addEventListener('click', listHandler, false);
        }

        function listHandler(evt) {
            evt.preventDefault();

            if (evt.target.matches('.pl-list__title')) {
                var current = parseInt(evt.target.closest('.pl-list').getAttribute('data-track'), 10);
                if (index !== current) {
                    index = current;
                    play(current);
                }
                else {
                    playToggle();
                }
            }
            else {
                if (!!evt.target.closest('.pl-list__remove')) {
                    var parentEl = evt.target.closest('.pl-list');
                    var isDel = parseInt(parentEl.getAttribute('data-track'), 10);

                    playList.splice(isDel, 1);
                    parentEl.closest('.pl-ul').removeChild(parentEl);

                    plLi = pl.querySelectorAll('li');

                    [].forEach.call(plLi, function (el, i) {
                        el.setAttribute('data-track', i);
                    });

                    if (!audio.paused) {

                        if (isDel === index) {
                            play(index);
                        }

                    }
                    else {
                        if (isEmptyList()) {
                            clearAll();
                        }
                        else {
                            if (isDel === index) {
                                if (isDel > playList.length - 1) {
                                    index -= 1;
                                }
                                audio.src = playList[index].file;
                                trackTitle.innerHTML = playList[index].title;
                                progressBar.style.width = 0;
                            }
                        }
                    }
                    if (isDel < index) {
                        index--;
                    }
                }

            }
        }

        function plActive() {
            if (audio.paused) {
                plLi[index].classList.remove('pl-list--current');
                return;
            }
            var current = index;
            for (var i = 0, len = plLi.length; len > i; i++) {
                plLi[i].classList.remove('pl-list--current');
            }
            plLi[current].classList.add('pl-list--current');
        }


        /**
         * Player methods
         */
        function play(currentIndex) {

            if (isEmptyList()) {
                return clearAll();
            }

            index = (currentIndex + playList.length) % playList.length;

            audio.src = playList[index].file;
            trackTitle.innerHTML = playList[index].title;

            // Change document title
            changeDocumentTitle(playList[index].title);

            // Audio play
            audio.play();

            // Show notification
            notify(playList[index].title, {
                icon: playList[index].icon,
                body: 'Now playing',
                tag: 'music-player'
            });

            // Toggle play button
            playBtn.classList.add('is-playing');
            playSvgPath.setAttribute('d', playSvg.getAttribute('data-pause'));

            // Set active song playlist
            plActive();
        }

        function prev() {
            play(index - 1);
        }

        function next() {
            play(index + 1);
        }

        function isEmptyList() {
            return playList.length === 0;
        }

        function clearAll() {
            audio.pause();
            audio.src = '';
            trackTitle.innerHTML = 'queue is empty';
            curTime.innerHTML = '--';
            durTime.innerHTML = '--';
            progressBar.style.width = 0;
            preloadBar.style.width = 0;
            playBtn.classList.remove('is-playing');
            playSvgPath.setAttribute('d', playSvg.getAttribute('data-play'));
            if (!plUl.querySelector('.pl-list--empty')) {
                plUl.innerHTML = '<li class="pl-list--empty">PlayList is empty</li>';
            }
            changeDocumentTitle();
        }

        function playToggle() {
            if (isEmptyList()) {
                return;
            }
            if (audio.paused) {

                if (audio.currentTime === 0) {
                    notify(playList[index].title, {
                        icon: playList[index].icon,
                        body: 'Now playing'
                    });
                }
                changeDocumentTitle(playList[index].title);

                audio.play();

                playBtn.classList.add('is-playing');
                playSvgPath.setAttribute('d', playSvg.getAttribute('data-pause'));
            }
            else {
                changeDocumentTitle();
                audio.pause();
                playBtn.classList.remove('is-playing');
                playSvgPath.setAttribute('d', playSvg.getAttribute('data-play'));
            }
            plActive();
        }

        function volumeToggle() {
            if (audio.muted) {
                if (parseInt(volumeLength, 10) === 0) {
                    volumeBar.style.height = settings.volume * 100 + '%';
                    audio.volume = settings.volume;
                }
                else {
                    volumeBar.style.height = volumeLength;
                }
                audio.muted = false;
                volumeBtn.classList.remove('has-muted');
            }
            else {
                audio.muted = true;
                volumeBar.style.height = 0;
                volumeBtn.classList.add('has-muted');
            }
        }

        function repeatToggle() {
            if (repeatBtn.classList.contains('is-active')) {
                repeating = false;
                repeatBtn.classList.remove('is-active');
            }
            else {
                repeating = true;
                repeatBtn.classList.add('is-active');
            }
        }

        function plToggle() {
            plBtn.classList.toggle('is-active');
            pl.classList.toggle('h-show');
        }

        function timeUpdate() {
            if (audio.readyState === 0 || seeking) return;

            var barlength = Math.round(audio.currentTime * (100 / audio.duration));
            progressBar.style.width = barlength + '%';

            var
                curMins = Math.floor(audio.currentTime / 60),
                curSecs = Math.floor(audio.currentTime - curMins * 60),
                mins = Math.floor(audio.duration / 60),
                secs = Math.floor(audio.duration - mins * 60);
            (curSecs < 10) && (curSecs = '0' + curSecs);
            (secs < 10) && (secs = '0' + secs);

            curTime.innerHTML = curMins + ':' + curSecs;
            durTime.innerHTML = mins + ':' + secs;

            if (settings.buffered) {
                var buffered = audio.buffered;
                if (buffered.length) {
                    var loaded = Math.round(100 * buffered.end(0) / audio.duration);
                    preloadBar.style.width = loaded + '%';
                }
            }
        }

        /**
         * TODO shuffle
         */
        function shuffle() {
            if (shuffle) {
                index = Math.round(Math.random() * playList.length);
            }
        }

        function doEnd() {
            if (index === playList.length - 1) {
                if (!repeating) {
                    audio.pause();
                    plActive();
                    playBtn.classList.remove('is-playing');
                    playSvgPath.setAttribute('d', playSvg.getAttribute('data-play'));
                    return;
                }
                else {
                    play(0);
                }
            }
            else {
                play(index + 1);
            }
        }

        function moveBar(evt, el, dir) {
            var value;
            if (dir === 'horizontal') {
                value = Math.round(((evt.clientX - el.offset().left) + window.pageXOffset) * 100 / el.parentNode.offsetWidth);
                el.style.width = value + '%';
                return value;
            }
            else {
                if (evt.type === wheel()) {
                    value = parseInt(volumeLength, 10);
                    var delta = evt.deltaY || evt.detail || -evt.wheelDelta;
                    value = (delta > 0) ? value - 10 : value + 10;
                }
                else {
                    var offset = (el.offset().top + el.offsetHeight) - window.pageYOffset;
                    value = Math.round((offset - evt.clientY));
                }
                if (value > 100) value = wheelVolumeValue = 100;
                if (value < 0) value = wheelVolumeValue = 0;
                volumeBar.style.height = value + '%';
                return value;
            }
        }

        function handlerBar(evt) {
            rightClick = (evt.which === 3) ? true : false;
            seeking = true;
            !rightClick && progressBar.classList.add('progress__bar--active');
            seek(evt);
        }

        function handlerVol(evt) {
            rightClick = (evt.which === 3) ? true : false;
            seekingVol = true;
            setVolume(evt);
        }

        function seek(evt) {
            evt.preventDefault();
            if (seeking && rightClick === false && audio.readyState !== 0) {
                window.value = moveBar(evt, progressBar, 'horizontal');
            }
        }

        function seekingFalse() {
            if (seeking && rightClick === false && audio.readyState !== 0) {
                audio.currentTime = audio.duration * (window.value / 100);
                progressBar.classList.remove('progress__bar--active');
            }
            seeking = false;
            seekingVol = false;
        }

        function setVolume(evt) {
            evt.preventDefault();
            volumeLength = volumeBar.css('height');
            if (seekingVol && rightClick === false || evt.type === wheel()) {
                var value = moveBar(evt, volumeBar.parentNode, 'vertical') / 100;
                if (value <= 0) {
                    audio.volume = 0;
                    audio.muted = true;
                    volumeBtn.classList.add('has-muted');
                }
                else {
                    if (audio.muted) audio.muted = false;
                    audio.volume = value;
                    volumeBtn.classList.remove('has-muted');
                }
            }
        }

        function notify(title, attr) {
            if (!settings.notification) {
                return;
            }
            if (window.Notification === undefined) {
                return;
            }
            attr.tag = 'AP music player';
            window.Notification.requestPermission(function (access) {
                if (access === 'granted') {
                    var notice = new Notification(title.substr(0, 110), attr);
                    setTimeout(notice.close.bind(notice), 5000);
                }
            });
        }

        /* Destroy method. Clear All */
        function destroy() {
            if (!apActive) return;

            if (settings.confirmClose) {
                window.removeEventListener('beforeunload', beforeUnload, false);
            }

            playBtn.removeEventListener('click', playToggle, false);
            volumeBtn.removeEventListener('click', volumeToggle, false);
            repeatBtn.removeEventListener('click', repeatToggle, false);
            plBtn.removeEventListener('click', plToggle, false);

            progressBar.closest('.progress-container').removeEventListener('mousedown', handlerBar, false);
            progressBar.closest('.progress-container').removeEventListener('mousemove', seek, false);
            document.documentElement.removeEventListener('mouseup', seekingFalse, false);

            volumeBar.closest('.volume').removeEventListener('mousedown', handlerVol, false);
            volumeBar.closest('.volume').removeEventListener('mousemove', setVolume);
            volumeBar.closest('.volume').removeEventListener(wheel(), setVolume);
            document.documentElement.removeEventListener('mouseup', seekingFalse, false);

            prevBtn.removeEventListener('click', prev, false);
            nextBtn.removeEventListener('click', next, false);

            audio.removeEventListener('error', errorHandler, false);
            audio.removeEventListener('timeupdate', timeUpdate, false);
            audio.removeEventListener('ended', doEnd, false);

            // Playlist
            pl.removeEventListener('click', listHandler, false);
            pl.parentNode.removeChild(pl);

            audio.pause();
            apActive = false;
            index = 0;

            playBtn.classList.remove('is-playing');
            playSvgPath.setAttribute('d', playSvg.getAttribute('data-play'));
            volumeBtn.classList.remove('has-muted');
            plBtn.classList.remove('is-active');
            repeatBtn.classList.remove('is-active');

            // Remove player from the DOM if necessary
            // player.parentNode.removeChild(player);
        }


        /**
         *  Helpers
         */
        function wheel() {
            var wheel;
            if ('onwheel' in document) {
                wheel = 'wheel';
            } else if ('onmousewheel' in document) {
                wheel = 'mousewheel';
            } else {
                wheel = 'MozMousePixelScroll';
            }
            return wheel;
        }

        function extend(defaults, options) {
            for (var name in options) {
                if (defaults.hasOwnProperty(name)) {
                    defaults[name] = options[name];
                }
            }
            return defaults;
        }
        function create(el, attr) {
            var element = document.createElement(el);
            if (attr) {
                for (var name in attr) {
                    if (element[name] !== undefined) {
                        element[name] = attr[name];
                    }
                }
            }
            return element;
        }

        Element.prototype.offset = function () {
            var el = this.getBoundingClientRect(),
                scrollLeft = window.pageXOffset || document.documentElement.scrollLeft,
                scrollTop = window.pageYOffset || document.documentElement.scrollTop;

            return {
                top: el.top + scrollTop,
                left: el.left + scrollLeft
            };
        };

        Element.prototype.css = function (attr) {
            if (typeof attr === 'string') {
                return getComputedStyle(this, '')[attr];
            }
            else if (typeof attr === 'object') {
                for (var name in attr) {
                    if (this.style[name] !== undefined) {
                        this.style[name] = attr[name];
                    }
                }
            }
        };

        // matches polyfill
        window.Element && function (ElementPrototype) {
            ElementPrototype.matches = ElementPrototype.matches ||
                ElementPrototype.matchesSelector ||
                ElementPrototype.webkitMatchesSelector ||
                ElementPrototype.msMatchesSelector ||
                function (selector) {
                    var node = this, nodes = (node.parentNode || node.document).querySelectorAll(selector), i = -1;
                    while (nodes[++i] && nodes[i] != node);
                    return !!nodes[i];
                };
        }(Element.prototype);

        // closest polyfill
        window.Element && function (ElementPrototype) {
            ElementPrototype.closest = ElementPrototype.closest ||
                function (selector) {
                    var el = this;
                    while (el.matches && !el.matches(selector)) el = el.parentNode;
                    return el.matches ? el : null;
                };
        }(Element.prototype);

        /**
         *  Public methods
         */
        return {
            init: init,
            update: updatePL,
            destroy: destroy
        };

    })();

    window.AP = AudioPlayer;

})(window);

// TEST: image for web notifications
var iconImage = '<i class="fas fa-music"></i>';
$(function(){
	console.log("hi");
});


  
 $(()=> {
	let cs= document.getElementById('code');
	console.log(cs);
	
	const code =$('#code p');
	console.log(code);
	$.ajax({
		url:'${pageContext.request.contextPath}/audiobook/playList',
		contentType: 'application/json; charset=UTF-8',
		headers: headers,
		dataType:"json",
		success(resp){
			console.log(resp);	
		},
		error: console.log,
		complete(){
			alert("전송완료.");
		}
	});
}); 

/*		'title': '${track.originalFilename}',  */
var playList= new Array();
<c:forEach items="${trackList}" var="track" varStatus="status">
	
	let title${status.index} = "${track.originalFilename}";
	title${status.index}.replace(/\'/gi,'');
	playList.push({
		'icon': iconImage,
		'title': title${status.index},
		'file' : '${pageContext.request.contextPath}/resources/upload/audiobook/mp3/${track.renamedFilename}'
	});
	console.log(title${status.index});
</c:forEach>
console.log(playList);


AP.init({
	/* 토큰 
	const csrfHeader = "${_csrf.headerName}";
	const csrfToken = "${_csrf.token}";
	const headers = {};
	headers[csrfHeader] = csrfToken; 
	*/
    playList: playList
});


</script>

<script>
	/* const mySong = document.getElementById("mySong");
	const icon = document.getElementById("icon");
	icon.onclick = function() {
		console.log(icon);
		if (mySong.paused) {
			mySong.play();
			icon.src = "${pageContext.request.contextPath}/resources/images/audiobook/pause.png";
		} else {
			mySong.pause();
			icon.src = "${pageContext.request.contextPath}/resources/images/audiobook/play.png";
		}
	} */
</script>

<div class="modal fade" id="videoModal" tabindex="-1" role="dialog"
	aria-labelledby="videoModal" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-body">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<div>
					<iframe width="100%" height="350" src=""></iframe>
				</div>
			</div>
		</div>
	</div>
</div>

<script>
	function autoPlayYouTubeModal() {
		var trigger = $("body").find('[data-toggle="modal"]');
		trigger.click(function() {
			var theModal = $(this).data("target"), videoSRC = $(this).attr(
					"data-theVideo"), videoSRCauto = videoSRC + "?autoplay=1";
			$(theModal + ' iframe').attr('src', videoSRCauto);
			$(theModal + ' button.close').click(function() {
				$(theModal + ' iframe').attr('src', videoSRC);
			});
		});
	}
</script>




<!-- 결제 모달 영역  -->
<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static"
	data-bs-keyboard="false" tabindex="-1"
	aria-labelledby="staticBackdropLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="staticBackdropLabel">결제요청</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">정기결제 하신뒤 이용이 가능합니다.</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary"
					data-bs-dismiss="modal">취소</button>
				<button type="button" class="btn btn-primary">진행</button>
			</div>
		</div>
	</div>
</div>


<script>
	$('#testBtn').on(
			'click',
			function() {
				const $test = $('#testBtn');
				const data = $test.parent().parent().children('div.card-body')
						.first().children('h5');
				console.log(data);
				$('#staticBackdrop').modal('show');
	});
</script>

</section>

</div>
</body>

</html>
