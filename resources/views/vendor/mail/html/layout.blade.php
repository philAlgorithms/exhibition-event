<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>{{ config('app.name') }}</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="color-scheme" content="light">
<meta name="supported-color-schemes" content="light">
<style>
@font-face {
    font-family: "Satoshi-Variable";
    src: url("https://api.natesaconsulting.com/fonts/Satoshi/Satoshi-Variable.woff2") format("woff2"),
        url("https://api.natesaconsulting.com/fonts/Satoshi/Satoshi-Variable.woff") format("woff"),
        url("https://api.natesaconsulting.com/fonts/Satoshi/Satoshi-Variable.ttf") format("truetype");
    font-weight: 300 900;
    font-display: swap;
    font-style: normal;
}

@font-face {
    font-family: "Satoshi-VariableItalic";
    src: url("https://api.natesaconsulting.com/fonts/Satoshi/Satoshi-VariableItalic.woff2") format("woff2"),
        url("https://api.natesaconsulting.com/fonts/Satoshi/Satoshi-VariableItalic.woff") format("woff"),
        url("https://api.natesaconsulting.com/fonts/Satoshi/Satoshi-VariableItalic.ttf") format("truetype");
    font-weight: 300 900;
    font-display: swap;
    font-style: italic;
}
@media only screen and (max-width: 375px) {
.inner-body {
width: 330.15px !important;
}

.footer, .section {
width: 330.15px !important;
}
}

@media only screen and (min-width: 376px) {
.inner-body {
width: 442px !important;
}

.footer, .section {
width: 442px !important;
}
}

@media only screen and (max-width: 500px) {
.button {
width: 100% !important;
}
}


@media only screen and (min-width: 640px) {
    .content-label {
        font-size: 15px !important;
        line-height: 22.5px !important;
    }
    .content-value-lg {
        font-size: 24px !important;
        line-height: 24.72px !important;
    }
    .content-value {
        font-size: 20px !important;
        line-height: 20.6px !important;
        max-width: 307px !important;
    }
    
    .content-value-title {
        max-width: 191px !important;
    }
}
</style>
</head>
<body>

<table class="wrapper" width="100%" cellpadding="0" cellspacing="0" role="presentation">
<tr>
<td align="center">
<table class="content" width="100%" cellpadding="0" cellspacing="0" role="presentation">
{{ $header ?? '' }}

<!-- Email Body -->
<tr>
<td class="body" width="100%" cellpadding="0" cellspacing="0" style="border: hidden !important;">
<table class="inner-body" align="center" width="570" cellpadding="0" cellspacing="0" role="presentation">
<!-- Body content -->
<tr>
<td class="content-cell">
{{ Illuminate\Mail\Markdown::parse($slot) }}

{{ $subcopy ?? '' }}
</td>
</tr>
</table>
</td>
</tr>

{{ $footer ?? '' }}
</table>
</td>
</tr>
</table>
</body>
</html>
