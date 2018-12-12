<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WordCloudWebPage.aspx.cs" Inherits="word_cloud_dot_net.WordCloudWebPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Word Cloud</title>
    <link type="text/css" rel="stylesheet" href="../../assets/css/modules/boostbox/css/theme-5/bootstrap1cc3.css?1401441891" />

    <link type="text/css" rel="stylesheet" href="../../assets/css/modules/boostbox/css/theme-5/boostbox47dd.css?1401441889" />

    <link type="text/css" rel="stylesheet" href="../../assets/css/modules/boostbox/css/theme-5/boostbox_responsive47dd.css?1401441889" />

    <link type="text/css" rel="stylesheet" href="../../assets/css/modules/boostbox/css/theme-5/font-awesome.min1cc3.css?1401441891" />

    <link type="text/css" rel="stylesheet" href="../../assets/css/modules/boostbox/css/theme-5/libs/DataTables/jquery.dataTables872c.css?1401441889" />

    <link type="text/css" rel="stylesheet" href="../../assets/css/modules/boostbox/css/theme-5/libs/DataTables/TableTools872c.css?1401441889" />

    <link href="css/jquerysctipttop.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" type="text/css" href="css/jqcloud.css" />
    <script src="js/jquery-1.12.4.min.js"></script>
    <script type="text/javascript" src="js/jqcloud-1.0.4.js"></script>

    <script type="text/javascript">
        var word_list = [
            <%= WordList %>
          <%--<%= FrontData%>--%>
        ];
        $(function () {
            $("#my_favorite_latin_words").jQCloud(word_list);
        });
    </script>

</head>
<body>
    <form id="form1" runat="server">
        <div></div>

        <div id="base">
            <div id="content">
                <section>
                    <div class="section-body">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="box">
                                    <div class="box-head">
                                        <header>
                                            <h4 class="text-light">Word <strong>Cloude</strong></h4>
                                        </header>
                                    </div>
                                    <div class="box-body">

                                        <div class="form-horizontal" role="form">
                                            <div class="form-group">
                                                <div class="col-lg-3 col-md-2 col-sm-3">
                                                    <label for="textarea1" class="control-label">
                                                        Generate Word Cloude Using : 
                                                    </label>
                                                </div>
                                                <div class="col-lg-9 col-md-10 col-sm-9">
                                                    <asp:DropDownList ID="DropDownList1" runat="server" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AutoPostBack="true" class="form-control">
                                                        <asp:ListItem Value="0">Use Text File</asp:ListItem>
                                                        <asp:ListItem Value="1" Selected="True">Write Own Text</asp:ListItem>
                                                    </asp:DropDownList>
                                                    <%--<textarea name="textarea1" id="textarea1" class="form-control" rows="3" placeholder="Textarea"></textarea>--%>
                                                </div>
                                            </div>
                                            <asp:Panel ID="Panel1" runat="server" Visible="false">
                                                <div class="form-group">
                                                    <div class="col-lg-3 col-md-2 col-sm-3">
                                                        <label for="textarea1" class="control-label">
                                                            Text Editor
                                                    <small>Write Text To Generate Cloud.</small>
                                                        </label>
                                                    </div>
                                                    <div class="col-lg-9 col-md-10 col-sm-9">
                                                        <asp:TextBox ID="TextBox1" runat="server" TextMode="MultiLine" class="form-control" Rows="5"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Words in TextEditor is Required" Display="Dynamic" ControlToValidate="TextBox1" ValidationGroup="abc"></asp:RequiredFieldValidator>
                                                        <%--<textarea name="textarea1" id="textarea1" class="form-control" rows="3" placeholder="Textarea"></textarea>--%>
                                                    </div>
                                                </div>
                                            </asp:Panel>
                                            <asp:Panel ID="Panel2" runat="server" Visible="false">
                                                <div class="form-group">
                                                    <div class="col-lg-3 col-md-2 col-sm-3">
                                                        <label for="textarea1" class="control-label">
                                                            Select Text File
                                                    <small>Select File To Generate Cloud.</small>
                                                        </label>
                                                    </div>
                                                    <div class="col-lg-9 col-md-10 col-sm-9">
                                                        <asp:FileUpload ID="FileUpload1" runat="server" />
                                                        <asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="Select Only Text File" Display="Dynamic"></asp:CustomValidator>
                                                        <%--<textarea name="textarea1" id="textarea1" class="form-control" rows="3" placeholder="Textarea"></textarea>--%>
                                                    </div>
                                                </div>
                                            </asp:Panel>

                                            <div class="form-footer col-lg-offset-1 col-md-offset-2 col-sm-offset-3">
                                                <asp:Button ID="Button1" runat="server" class="btn btn-primary" Text="Generate" OnClick="Button1_Click" ValidationGroup="abc" />
                                                <asp:Button ID="Button2" runat="server" class="btn btn-default" Text="Reset" OnClick="Button2_Click" />
                                                <%--<button type="submit" class="btn btn-primary">Submit</button>
                                                <button type="submit" class="btn btn-default">Reset</button>--%>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="col-lg-4">
                                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" class="table table-striped table-hover dataTable" Style="border-top-width: initial;">
                                        <Columns>
                                            <asp:BoundField HeaderText="Word" DataField="WText" />
                                            <asp:BoundField HeaderText="Count" DataField="WCount" />
                                        </Columns>
                                    </asp:GridView>
                                </div>
                                <div class="col-lg-6">
                                    <div class="box">
                                        <div id="my_favorite_latin_words" style="width: inherit; height: 350px; border: 1px solid #ccc; background-color: #fafafa; font-family: 'Roboto';">
                                        </div>

                                    </div>
                                </div>
                                <%--<div class="col-lg-3"></div>--%>

                            </div>
                        </div>
                    </div>
                </section>
            </div>
        </div>
    </form>
</body>
</html>
