<!DOCTYPE html>
<html id="ng-app" ng-app="app">
<!-- id="ng-app" IE<8 -->

<head>
<title>Profile Image Upload</title>
<link rel="stylesheet"
	href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />

<!-- Fix for old browsers -->
<script src="http://nervgh.github.io/js/es5-shim.min.js"></script>
<script src="http://nervgh.github.io/js/es5-sham.min.js"></script>
<script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>

<script
	src="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!--<script src="../bower_components/angular/angular.js"></script>-->
<script src="http://code.angularjs.org/1.5.8/angular.min.js"></script>
<script src="/js/vendor/angular-file-upload.min.js"></script>
<script src="/js/controller/controllers.js"></script>

<!--thumbnails for images-->
<script src="/js/directive/directives.js"></script>

<script type="text/javascript">
	$(function() {

		// We can attach the `fileselect` event to all file inputs on the page
		$(document).on(
				'change',
				':file',
				function() {
					var input = $(this), numFiles = input.get(0).files ? input
							.get(0).files.length : 1, label = input.val()
							.replace(/\\/g, '/').replace(/.*\//, '');
					input.trigger('fileselect', [ numFiles, label ]);
				});
	});
</script>

<style>
.my-drop-zone {
	border: dotted 3px lightgray;
}

.nv-file-over {
	border: dotted 3px red;
} /* Default class applied to drop zones on over */
.another-file-over-class {
	border: dotted 3px green;
}

html, body {
	height: 100%;
}

canvas {
	background-color: #f3f3f3;
	-webkit-box-shadow: 3px 3px 3px 0 #e3e3e3;
	-moz-box-shadow: 3px 3px 3px 0 #e3e3e3;
	box-shadow: 3px 3px 3px 0 #e3e3e3;
	border: 1px solid #c3c3c3;
	height: 100px;
	margin: 6px 0 0 6px;
}
</style>

</head>

<!-- Example: nv-file-drop="" uploader="{Object}" options="{Object}" filters="{String}" -->
<body ng-controller="AppController" nv-file-drop="" uploader="uploader">

	<div class="container">
		<div class="navbar navbar-default">
			<div class="navbar-header">
				<a class="navbar-brand">Industrial Automation ERP</a>
			</div>
			<div class="navbar-collapse collapse">
				<ul class="nav navbar-nav">
					<li><a href="#">Login</a></li>
				</ul>
			</div>
		</div>

		<div class="row">
			<div class="col-md-9" style="margin-bottom: 40px">
				<table class="table">
					<thead>
						<tr>
							<th width="50%">Name</th>
							<th ng-show="uploader.isHTML5">Size</th>
							<th ng-show="uploader.isHTML5">Progress</th>
							<th>Status</th>
							<th>Actions</th>
						</tr>
					</thead>
					<tbody>
						<tr ng-repeat="item in uploader.queue">
							<td><strong>{{ item.file.name }}</strong> <!-- Image preview -->
								<!--auto height--> <!--<div ng-thumb="{ file: item.file, width: 100 }"></div>-->
								<!--auto width-->
								<div ng-show="uploader.isHTML5"
									ng-thumb="{ file: item._file, height: 100 }"></div> <!--fixed width and height -->
								<!--<div ng-thumb="{ file: item.file, width: 100, height: 100 }"></div>-->
							</td>
							<td ng-show="uploader.isHTML5" nowrap>{{
								item.file.size/1024/1024|number:3 }} MB</td>
							<td ng-show="uploader.isHTML5">
								<div class="progress" style="margin-bottom: 0;">
									<div class="progress-bar" role="progressbar"
										ng-style="{ 'width': item.progress + '%' }"></div>
								</div>
							</td>
							<td class="text-center"><span ng-show="item.isSuccess"><i
									class="glyphicon glyphicon-ok"></i></span> <span
								ng-show="item.isCancel"><i
									class="glyphicon glyphicon-ban-circle"></i></span> <span
								ng-show="item.isError"><i
									class="glyphicon glyphicon-remove"></i></span></td>
							<td nowrap>
								<button type="button" class="btn btn-success btn-xs"
									ng-click="item.upload()"
									ng-disabled="item.isReady || item.isUploading || item.isSuccess">
									<span class="glyphicon glyphicon-upload"></span> Upload
								</button>
								<button type="button" class="btn btn-warning btn-xs"
									ng-click="item.cancel()" ng-disabled="!item.isUploading">
									<span class="glyphicon glyphicon-ban-circle"></span> Cancel
								</button>
								<button type="button" class="btn btn-danger btn-xs"
									ng-click="item.remove()">
									<span class="glyphicon glyphicon-trash"></span> Remove
								</button>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>


		<div class="col-lg-3" class="col-md-3" class="col-sm-3">
			<div class="input-group">
				<label class="input-group-btn"> <span
					class="btn btn-primary"> <!-- Example: nv-file-select="" uploader="{Object}" options="{Object}" filters="{String}" -->
						Browse<input type="file" style="display: none;" nv-file-select=""
						uploader="uploader" />
				</span>
				</label>
			</div>
		</div>
</body>
</html>