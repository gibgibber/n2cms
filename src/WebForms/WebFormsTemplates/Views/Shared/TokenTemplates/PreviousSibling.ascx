﻿<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<string>" %>
<% var content = Html.Content(); %>
<% using (content.BeginScope(Model)) {
	N2.ContentItem prev = null;
	content.Traverse.Children(content.Traverse.Parent(), content.Is.AccessiblePage())
		.SkipWhile(i => { if (i != content.Path.CurrentItem) { prev = i; return true; } else return false; })
		.FirstOrDefault(); %>
	<%= content.LinkTo(prev) %>
<% } %>