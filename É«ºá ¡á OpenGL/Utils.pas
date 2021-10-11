{******************************************************************************}
{ Auteur  :Martin Beaudet                                                      }
{    Date :8 Octobre 2001                                                      }
{                                                                              }
{ Objectif :Initialisation d'OpenGL sur un DC (Device Context).                }
{           Autres proc�dures/Fonctions de services utilis�s pour OpenGL.      }
{******************************************************************************}
Unit Utils;
Interface
Uses Windows, SysUtils, OpenGL;

    { Initialisation/Finalisation de OpenGL }
     Function InitOpenGL( DC :HDC; ColorBits :Integer;
                          DoubleBuffer :Boolean ) :Boolean;
     Procedure Terminer;


Implementation
Var
   hDCGlobal   :HDC;    {Context graphique de la fen�tre}
   GLContext   :HGLRC;  {Passerelle pour utiliser OpenGL sur la fen�tre}



Function InitOpenGL( DC :HDC; ColorBits :Integer;
                     DoubleBuffer :Boolean ) :Boolean;
{Objectif  :Initialiser OpenGL sous la contexte graphique pass� en param�tre.
 Param�tres:

             DC           :Adresse graphique du composant qui s'appr�te � �tre
                           li� � OpenGL
             ColorBits    :Nombre bits pour une couleurs
             DoubleBuffer :Activation du double de tampon ou pas.}

Var
    PixelFormat    :TPixelFormatDescriptor; {Format de pixel}
    cPixelFormat   :Integer;                {Index du format de pixel trouv�}
begin
     {Pr�paration de la structure d'information sur le format de pixels}
     FillChar( PixelFormat, SizeOf(PixelFormat), 0 );
     With PixelFormat Do
     Begin
          nSize      := Sizeof(TPixelFormatDescriptor);
          If DoubleBuffer Then
             dwFlags    := PFD_DOUBLEBUFFER or PFD_DRAW_TO_WINDOW or PFD_SUPPORT_OPENGL
          Else
              dwFlags    := PFD_DRAW_TO_WINDOW or PFD_SUPPORT_OPENGL;
          iLayerType := PFD_MAIN_PLANE;
          iPixelType := PFD_TYPE_RGBA;
          nVersion   := 1;
          cColorBits := 16;
          CdepthBits := 16;
     End;

     {R�cup�ration du DC pass� en param�tre, dans une variable Global.}
     hDCGlobal := DC;

     {Choix du format de pixel adapt� pour le DC re�u en param�tre.}
     cPixelFormat := ChoosePixelFormat(DC, @PixelFormat);

     {V�rifier si l'index du format de pixel support� � �t� trouv�e}
     Result := cPixelFormat <> 0;
     If Not Result Then
     Begin
          MessageBox(0, pChar(SysErrorMessage(GetLastError)),
                     'Init OpenGL', mb_OK);
          Exit;
     End;

     {V�rifier si le format de pixel trouv� peut �tre appliqu� sur le DC}
     Result := SetPixelFormat( DC, cPixelFormat, @PixelFormat);
     If Not Result Then
     Begin
          MessageBox(0, pChar(SysErrorMessage(GetLastError)),
                    'Init OpenGL', mb_OK);
          Exit;
     End;

     {V�rifier si OpenGL cr�er la passerelle qui lui permettera de dessiner
      sur ce DC.}
     GLContext := wglCreateContext( DC );
     Result := GLContext <> 0;
     If Not Result Then
     Begin
          MessageBox(0, pChar(SysErrorMessage(GetLastError)),
                    'Init OpenGL', mb_OK);
          Exit;
     End;

     {V�rifier si OpenGL peut se servir de ce DC pour dessiner.}
     Result := wglMakeCurrent( DC, GLContext );
     If Not Result Then
     Begin
          MessageBox(0, pChar(SysErrorMessage(GetLastError)),
                    'Init OpenGL', mb_OK);
          Exit;
     End;
End;

Procedure Terminer;
{Objectif :Briser le lien avec OpenGL.}
Begin
     {Supression du lien entre OpenGL et notre application.}
     If Not wglMakeCurrent( hDCGlobal, 0 ) Then
     Begin
          MessageBox(0, pChar(SysErrorMessage(GetLastError)),
                    'Init OpenGL', mb_OK);
          Exit;
     End;

     If Not wglDeleteContext( GLContext ) Then
     Begin
          MessageBox(0, pChar(SysErrorMessage(GetLastError)),
                    'Init OpenGL', mb_OK);
          Exit;
     End;
End;

end.
